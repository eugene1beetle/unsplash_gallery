import 'package:flutter/material.dart';

import 'package:unsplash_gallery/model/unsplash_image.dart';

class PhotoDetailsScreen extends StatelessWidget {
  static const routeName = '/photo-details';

  const PhotoDetailsScreen({Key? key}) : super(key: key);

  String generateDescription(String? description, String? alternative) {
    if (description == null && alternative == null) {
      return 'Image has no description';
    }
    return [description, alternative].where((e) => e != null).join('. ');
  }

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as UnsplashImage;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: Hero(
                tag: 'image-id-${image.id}',
                child: Image.network(
                  image.urls.small,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 4, bottom: 4),
                    child: Text(
                      '${image.likes} likes | Author: ${image.user.name}',
                    ),
                  ),
                  Text(
                    generateDescription(
                      image.description,
                      image.alt_description,
                    ),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  // Text(DateTime.parse(image.created_at)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
