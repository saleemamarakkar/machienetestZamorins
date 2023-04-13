import 'package:json_annotation/json_annotation.dart';

import 'profile_image.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? username;
  String? name;
  @JsonKey(name: 'profile_image')
  ProfileImage? profileImage;

  User({this.id, this.username, this.name, this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
