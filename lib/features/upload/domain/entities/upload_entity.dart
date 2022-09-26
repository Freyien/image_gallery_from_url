import 'package:image_gallery_from_url/features/upload/domain/entities/image_entity.dart';
import 'package:image_gallery_from_url/features/upload/domain/entities/url_entity.dart';

class UploadEntity {
  final UrlEntity urlEntity;
  final List<ImageEntity> imageList;
  final int selectedIndex;
  final int maxImageLenght;

  UploadEntity({
    this.urlEntity = const UrlEntity.pure(),
    this.imageList = const [],
    this.selectedIndex = 0,
    this.maxImageLenght = 5,
  });

  UploadEntity copyWith({
    UrlEntity? urlEntity,
    List<ImageEntity>? imageList,
    int? selectedIndex,
  }) =>
      UploadEntity(
        urlEntity: urlEntity ?? this.urlEntity,
        imageList: imageList ?? this.imageList,
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );

  bool get isEnabledToUpload => imageList.length < maxImageLenght;
}
