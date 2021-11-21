// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashImage _$UnsplashImageFromJson(Map<String, dynamic> json) =>
    UnsplashImage(
      id: json['id'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      color: json['color'] as String,
      blur_hash: json['blur_hash'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      likes: json['likes'] as int,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      description: json['description'] as String?,
      alt_description: json['alt_description'] as String?,
    );

Map<String, dynamic> _$UnsplashImageToJson(UnsplashImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'color': instance.color,
      'blur_hash': instance.blur_hash,
      'description': instance.description,
      'alt_description': instance.alt_description,
      'width': instance.width,
      'height': instance.height,
      'likes': instance.likes,
      'urls': instance.urls.toJson(),
      'user': instance.user.toJson(),
    };
