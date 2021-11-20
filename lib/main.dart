import 'package:flutter/material.dart';

import 'package:unsplash_gallery/theme/theme.dart';
import 'package:unsplash_gallery/navigation/navigation.dart';

void main() => runApp(const UnsplashGalleryApp());

class UnsplashGalleryApp extends StatelessWidget {
  const UnsplashGalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash Gallery',
      theme: theme,
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
