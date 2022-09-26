import 'package:dartz/dartz.dart';
import 'package:image_gallery_from_url/core/domain/failures/failures.dart';
import 'package:image_gallery_from_url/features/app_config/domain/repositories/app_config_repository.dart';
import 'package:sqflite/sqlite_api.dart';

class AppConfigRepositoryImpl implements AppConfigRepository {
  final Database localDataBase;

  AppConfigRepositoryImpl(this.localDataBase);

  @override
  Future<Either<Failure, bool>> checkUserIsLogged() async {
    try {
      final response = await localDataBase.query('session', limit: 1);

      final bool isLogged = response.isNotEmpty;

      return Right(isLogged);
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }
}
