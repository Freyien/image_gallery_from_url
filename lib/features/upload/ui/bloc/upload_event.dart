part of 'upload_bloc.dart';

@immutable
abstract class UploadEvent {}

class LoadImagesEvent extends UploadEvent {}

class ChangeUrlEvent extends UploadEvent {
  final String url;

  ChangeUrlEvent(this.url);
}

class ClearUrlEvent extends UploadEvent {}

class UploadImageEvent extends UploadEvent {}

class ChangeSelectedImageEvent extends UploadEvent {
  final int index;

  ChangeSelectedImageEvent(this.index);
}

class DeleteImageEvent extends UploadEvent {
  final ImageEntity image;

  DeleteImageEvent(this.image);
}
