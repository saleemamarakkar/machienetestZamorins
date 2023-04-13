import 'package:dartz/dartz.dart';
import 'package:pastebin/Models/profileimage/user.dart';
import 'package:pastebin/domain/failure/mainfailure.dart';

abstract class ImageRepo {
  Future<Either<MainFailure, List<User>>> getDownloadsImage();
}
