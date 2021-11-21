import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:unsplash_gallery/bloc/image_bloc.dart';
import 'package:unsplash_gallery/screens/photo_details_screen.dart';

class PhotoListScreen extends StatefulWidget {
  static const routeName = '/photo-list';

  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List Screen'),
      ),
      body: BlocBuilder<ImageBloc, ImageState>(builder: (_, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) => SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PhotoDetailsScreen.routeName,
                      arguments: state.images[index],
                    );
                  },
                  child: Hero(
                    tag: 'image-id-${state.images[index].id}',
                    child: Image.network(
                      state.images[index].urls.small,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Opacity(
                    opacity: 0.55,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.all(4.0),
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${state.images[index].likes} ',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svg/heart.svg',
                            height: 20,
                            width: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          itemCount: state.images.length,
          controller: _scrollController,
        );
      }),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isNearEnd) {
      context.read<ImageBloc>().add(FetchImages());
    }
  }

  bool get _isNearEnd {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
