import 'package:unsplash_gallery/model/unsplash_image.dart';
import 'urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UnsplashApi {
  static Future<List<UnsplashImage>> fetchImages(
      {int perPage = 30, int page = 1}) async {
    final queryParams = {
      'client_id': unsplashApiToken,
      'per_page': perPage.toString(),
      'page': page.toString(),
    };
    final uri = Uri.https(baseUrl, photos, queryParams);
    final response = await http.get(uri);
    final list = convert.jsonDecode(response.body) as List<dynamic>;

    return list.map((imageItem) => UnsplashImage.fromJson(imageItem)).toList();
  }
}
