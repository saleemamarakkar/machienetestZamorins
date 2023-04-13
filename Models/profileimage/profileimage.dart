import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'profileimage.g.dart';

@JsonSerializable()
class Profileimage {
  User? user;

  Profileimage({this.user});

  factory Profileimage.fromJson(Map<String, dynamic> json) {
    return _$ProfileimageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileimageToJson(this);
}
