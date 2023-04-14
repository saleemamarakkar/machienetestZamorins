import 'package:dartz/dartz.dart';
import 'package:pastebin/Models/profileimage/profile_image.dart';
import 'package:pastebin/Models/profileimage/profileimage.dart';
import 'package:pastebin/Models/profileimage/user.dart';
import 'package:pastebin/domain/failure/mainfailure.dart';

abstract class ImageRepo {
  Future<Either<MainFailure, List<Profileimage>>> getDownloadsImage();
}
