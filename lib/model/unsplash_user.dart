import 'package:json_annotation/json_annotation.dart';

part 'unsplash_user.g.dart';

@JsonSerializable()
class User {
  final String name, username;
  final String? instagram_username, twitter_username;

  const User({
    required this.name,
    required this.username,
    this.instagram_username,
    this.twitter_username,
  });

  @override
  String toString() {
    return 'User{name: $name, username: $username, instagram_username: $instagram_username, twitter_username: $twitter_username}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
