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
        if (state.status == Status.success || state.images.isNotEmpty) {
          return Stack(
            children: [
              renderGridView(state),
              if (state.status != Status.success)
                Opacity(
                  opacity: 0.33,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(8),
                    child: state.status == Status.fetching
                        ? const CircularProgressIndicator()
                        : const Text('Error while fetching images'),
                  ),
                ),
            ],
          );
        } else if (state.status == Status.failure) {
          return const Center(
            child: Text('Can\'t load images'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Widget renderGridView(ImageState state) => GridView.builder(
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
                  tag: 'image-id-${state.images[index].id}-${state.images[index].user.username}',
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
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
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
