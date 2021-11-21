import 'package:json_annotation/json_annotation.dart';

part 'unsplash_user.g.dart';

@JsonSerializable()
class User {
  final String name, username;

  const User({
    required this.name,
    required this.username,
  });

  @override
  String toString() {
    return 'User{name: $name, username: $username}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
