import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                tag: 'image-id-${image.id}-${image.user.username}',
                child: Image.network(
                  image.urls.small,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/heart.svg',
                            width: 24,
                          ),
                          Text(
                            ' ${image.likes}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      Text(
                        image.user.username,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    generateDescription(
                      image.description,
                      image.alt_description,
                    ),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Author social media accounts:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 4, top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Instagram: ${image.user.instagram_username == null ? 'not connected' : '@${image.user.instagram_username}'}',
                          style: const TextStyle(fontSize: 13),
                        ),
                        Text(
                          'Twitter: ${image.user.twitter_username == null ? 'not connected' : '@${image.user.twitter_username}'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
