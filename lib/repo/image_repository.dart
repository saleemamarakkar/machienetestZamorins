import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pastebin/Models/profileimage/user.dart';
import 'package:pastebin/constants/constants.dart';
import 'package:pastebin/domain/failure/mainfailure.dart';
import 'package:pastebin/infrastructure/image_repo.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: ImageRepo)
class ImageRepository implements ImageRepo {
  @override
  Future<Either<MainFailure, List<User>>> getDownloadsImage() async {
    //{required String movieQuery}
    try {
      final response = await Dio(BaseOptions()).get(imageUrl);

      //   final response = await Dio(BaseOptions())
      //      .get(imageUrl, queryParameters: {'query': movieQuery});
      print(response.data.toString());
      //  return right(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final searchResultkey = User.fromJson(response.data);
        final downloadImageList = (response.data['user'] as List)
            .map((e) => User.fromJson(e))
            .toList();
        return Right(downloadImageList);
      } else {
        return const Left(MainFailure.ServerFailure());
      }
    } catch (_) {
      return const Left(MainFailure.ClientFailure());
    }
  }
}
