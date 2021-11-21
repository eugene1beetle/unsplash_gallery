import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/bloc/image_bloc.dart';

class PhotoListScreen extends StatelessWidget {
  static const routeName = '/photo-list';

  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List Screen'),
      ),
      body: BlocBuilder<ImageBloc, ImageState>(builder: (_, state) {
        return Column(
          children: state.images.map((image) => Text(image.id)).toList(),
        );
      }),
    );
  }
}
