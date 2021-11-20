import 'package:flutter/material.dart';

import 'package:unsplash_gallery/theme/theme.dart';

void main() => runApp(const UnsplashGalleryApp());

class UnsplashGalleryApp extends StatelessWidget {
  const UnsplashGalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash Gallery',
      theme: theme,
      home: const Center(
        child: Text('Hello :3'),
      ),
    );
  }
}
