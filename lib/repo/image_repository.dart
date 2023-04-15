import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pastebin/Models/UserSearchModel.dart';
import 'package:pastebin/Models/profileimage/profile_image.dart';
import 'package:pastebin/Models/profileimage/profileimage.dart';
import 'package:pastebin/Models/profileimage/user.dart';
import 'package:pastebin/constants/constants.dart';
import 'package:pastebin/domain/failure/mainfailure.dart';
import 'package:pastebin/infrastructure/image_repo.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: ImageRepo)
class ImageRepository implements ImageRepo {
  @override
  Future<Either<MainFailure, List<Profileimage>>> getDownloadsImage() async {
    try {
      final response = await Dio(BaseOptions()).get(imageUrl);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
//json decode
        var resData = json.decode(response.data);

        //print(resData.toString());
        final list = (json.decode(response.data) as List)
            .map((data) => Profileimage.fromJson(data))
            .toList();
        print(list);
        print(list[0].user!.profileImage!.medium);

        return Right(list);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (e) {
      print(e.toString());
      return const Left(MainFailure.ClientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<User>>> getSearchResult(
      {required String searchKey}) async {
    try {
      final response = await Dio(BaseOptions()).get(imageUrl);
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
//json decode
        var resData = json.decode(response.data);

        //print(resData.toString());
        final list = (json.decode(response.data) as List)
            .map((data) => Profileimage.fromJson(data))
            .toList();
        print(list);
        print(list[0].user!.profileImage!.medium);
        final List serachedImagesList = [];
        final List<User> UserInsearchList = [];
        final List Name = [];
        for (int i = 0; i < list.length; i++) {
          print("list[i].user!.name!");
          print(list[i].user!.name!);
          print("search key");
          print(searchKey);
          String listName = list[i].user!.name!;
          Name.add(listName);
          if ("saleema" == "saleema") {
            print("saleema is equal string");
          }
          if (searchKey == listName) {
            print("equal strings");
            final serachedimage = list[i].user!.profileImage!.medium;
            serachedImagesList.add(serachedimage);
            final userInSearch = list[i].user!;
            UserInsearchList.add(userInSearch);
            print("object that contains name in search $userInSearch");
          } else {
            print("not equal");
          }
        }
        //final UserSearchModel userSearchModel=  UserSearchModel(imageList: serachedImagesList, name: Name);

        //  print("search image list$serachedImagesList");
        return Right(UserInsearchList);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (e) {
      //  print(e.toString());
      return const Left(MainFailure.ClientFailure());

      //throw UnimplementedError();
    }
  }
}
