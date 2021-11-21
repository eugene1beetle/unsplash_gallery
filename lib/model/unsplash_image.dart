import 'package:json_annotation/json_annotation.dart';

part 'unsplash_image.g.dart';

@JsonSerializable()
class UnsplashImage {
  final String id, createdAt, updatedAt, color, blurHash, description;
  final int width, height, likes;

  const UnsplashImage({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.width,
    required this.height,
    required this.likes,
  });

  @override
  String toString() {
    return 'UnsplashImage{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, color: $color, blurHash: $blurHash, description: $description, width: $width, height: $height, likes: $likes}';
  }

  factory UnsplashImage.fromJson(Map<String, dynamic> json) =>
      _$UnsplashImageFromJson(json);

  Map<String, dynamic> toJson() => _$UnsplashImageToJson(this);
}
