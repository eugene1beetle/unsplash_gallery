import 'package:json_annotation/json_annotation.dart';
import 'unsplash_image_urls.dart';
import 'unsplash_user.dart';

part 'unsplash_image.g.dart';

@JsonSerializable(explicitToJson: true)
class UnsplashImage {
  final String id, created_at, updated_at, color, blur_hash;
  final String? description, alt_description;
  final int width, height, likes;
  final Urls urls;
  final User user;

  const UnsplashImage({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.color,
    required this.blur_hash,
    required this.width,
    required this.height,
    required this.likes,
    required this.urls,
    required this.user,
    this.description,
    this.alt_description
  });

  @override
  String toString() {
    return 'UnsplashImage{id: $id, created_at: $created_at, updated_at: $updated_at, color: $color, blur_hash: $blur_hash, description: $description, alt_description: $alt_description, width: $width, height: $height, likes: $likes, urls: $urls, user: $user}';
  }

  factory UnsplashImage.fromJson(Map<String, dynamic> json) =>
      _$UnsplashImageFromJson(json);

  Map<String, dynamic> toJson() => _$UnsplashImageToJson(this);
}

