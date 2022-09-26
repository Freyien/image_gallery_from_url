import 'package:dartz/dartz.dart';
import 'package:image_gallery_from_url/core/domain/failures/failures.dart';
import 'package:image_gallery_from_url/features/upload/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<Either<Failure, Unit>> delete(String uuid);
  Future<Either<Failure, List<ImageEntity>>> getAll();
  Future<Either<Failure, ImageEntity>> upload(String url);
}
