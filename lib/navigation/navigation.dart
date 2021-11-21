import 'package:flutter/material.dart';

import 'package:unsplash_gallery/screens/photo_list_screen.dart';
import 'package:unsplash_gallery/screens/photo_details_screen.dart';

final Map<String, WidgetBuilder> routes = {
  PhotoListScreen.routeName: (ctx) => const PhotoListScreen(),
  PhotoDetailsScreen.routeName: (ctx) => const PhotoDetailsScreen(),
};

const initialRoute = PhotoListScreen.routeName;

