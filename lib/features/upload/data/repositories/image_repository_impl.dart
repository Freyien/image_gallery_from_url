import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_from_url/core/domain/failures/failures.dart';
import 'package:image_gallery_from_url/features/upload/domain/entities/entities.dart';
import 'package:image_gallery_from_url/features/upload/domain/failures/image_failure.dart';
import 'package:image_gallery_from_url/features/upload/domain/repositories/image_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:uuid/uuid.dart';

class ImageRepositoryImpl implements ImageRepository {
  final Dio client;
  final Connectivity connectivity;
  final Database localDataBase;
  final Uuid uuid;

  ImageRepositoryImpl(
    this.client,
    this.connectivity,
    this.localDataBase,
    this.uuid,
  );

  @override
  Future<Either<Failure, Unit>> delete(String uuid) async {
    try {
      await localDataBase.delete(
        'images',
        where: 'uuid = ?',
        whereArgs: [uuid],
      );

      return const Right(unit);
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<ImageEntity>>> getAll() async {
    try {
      final response = await localDataBase.query('images', limit: 5);

      final imagelist = List.generate(response.length, (i) {
        return ImageEntity.fromJson(response[i]);
      });

      return Right(imagelist);
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, ImageEntity>> upload(String url) async {
    try {
      // Check internet connection
      var connectivityResult = await (connectivity.checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        return Left(InternetFailure());
      }

      final newUuid = uuid.v4();
      final tempDir = await getTemporaryDirectory();
      String fullPath = tempDir.path + newUuid;

      await client.download(url, fullPath);

      final image = ImageEntity(
        uuid: newUuid,
        path: fullPath,
      );

      await localDataBase.insert(
        'images',
        image.toJson(),
      );

      return Right(image);
    } on DioError {
      return Left(InvalidUrlFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
