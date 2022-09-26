part of 'upload_bloc.dart';

@immutable
abstract class UploadState {
  final UploadEntity uploadEntity;

  const UploadState(this.uploadEntity);
}

class InitialState extends UploadState {
  const InitialState(super.uploadEntity);
}

class LoadingState extends UploadState {
  const LoadingState(super.uploadEntity);
}

class UrlChangedState extends UploadState {
  const UrlChangedState(super.uploadEntity);
}

class UrlClearedState extends UploadState {
  const UrlClearedState(super.uploadEntity);
}

class ImageLoadedState extends UploadState {
  const ImageLoadedState(super.uploadEntity);
}

class SelectedImageChangedState extends UploadState {
  const SelectedImageChangedState(super.uploadEntity);
}

class InvalidUrlState extends UploadState {
  const InvalidUrlState(super.uploadEntity);
}

class NoInternetConnectionState extends UploadState {
  const NoInternetConnectionState(super.uploadEntity);
}

class FailedState extends UploadState {
  const FailedState(super.uploadEntity);
}
