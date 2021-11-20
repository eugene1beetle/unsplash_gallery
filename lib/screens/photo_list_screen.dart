import 'package:flutter/material.dart';

class PhotoListScreen extends StatelessWidget {
  static const routeName = '/photo-list';
  const PhotoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo List Screen'),
      ),
      body: const Center(
        child: Text('New Screen'),
      ),
    );
  }
}
