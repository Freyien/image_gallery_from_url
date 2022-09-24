import 'package:dartz/dartz.dart';
import 'package:image_gallery_from_url/core/domain/failures/failures.dart';
import 'package:image_gallery_from_url/features/login/domain/failures/auth_failure.dart';
import 'package:image_gallery_from_url/features/login/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, Unit>> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    // Simulate server validation
    if (email != 'freyien@me.com') return Left(InvalidCredentialsFailure());
    if (password != '123456') Left(InvalidCredentialsFailure());

    return const Right(unit);
  }
}
