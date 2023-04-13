// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileimage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profileimage _$ProfileimageFromJson(Map<String, dynamic> json) => Profileimage(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileimageToJson(Profileimage instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
