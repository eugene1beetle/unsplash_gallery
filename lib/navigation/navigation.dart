import 'package:flutter/material.dart';

import 'package:unsplash_gallery/screens/photo_list_screen.dart';

final Map<String, WidgetBuilder> routes = {
  PhotoListScreen.routeName: (ctx) => const PhotoListScreen(),
};

const initialRoute = PhotoListScreen.routeName;

