// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashImage _$UnsplashImageFromJson(Map<String, dynamic> json) =>
    UnsplashImage(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      color: json['color'] as String,
      blurHash: json['blurHash'] as String,
      description: json['description'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      likes: json['likes'] as int,
    );

Map<String, dynamic> _$UnsplashImageToJson(UnsplashImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'color': instance.color,
      'blurHash': instance.blurHash,
      'description': instance.description,
      'width': instance.width,
      'height': instance.height,
      'likes': instance.likes,
    };
