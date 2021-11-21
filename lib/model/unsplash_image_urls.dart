import 'package:json_annotation/json_annotation.dart';

part 'unsplash_image_urls.g.dart';

@JsonSerializable()
class Urls {
  final String raw, full, regular, small, thumb;

  const Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  @override
  String toString() {
    return 'Urls{raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb}';
  }

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
