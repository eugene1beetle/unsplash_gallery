// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      username: json['username'] as String,
      instagram_username: json['instagram_username'] as String?,
      twitter_username: json['twitter_username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'instagram_username': instance.instagram_username,
      'twitter_username': instance.twitter_username,
    };
