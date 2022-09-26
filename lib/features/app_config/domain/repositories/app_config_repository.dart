import 'package:dartz/dartz.dart';
import 'package:image_gallery_from_url/core/domain/failures/failures.dart';

abstract class AppConfigRepository {
  Future<Either<Failure, bool>> checkUserIsLogged();
}
