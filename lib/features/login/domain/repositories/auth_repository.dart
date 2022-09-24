import 'package:dartz/dartz.dart';
import 'package:image_gallery_from_url/core/domain/failures/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIn(String email, String password);
}
