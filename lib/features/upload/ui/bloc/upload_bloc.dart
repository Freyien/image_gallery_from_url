import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/core/domain/failures/failures.dart';
import 'package:image_gallery_from_url/features/upload/domain/entities/entities.dart';
import 'package:image_gallery_from_url/features/upload/domain/failures/image_failure.dart';
import 'package:image_gallery_from_url/features/upload/domain/repositories/image_repository.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final ImageRepository imageRepository;

  UploadBloc(this.imageRepository) : super(initialState) {
    on<LoadImagesEvent>(_loadImagesEvent);
    on<ChangeUrlEvent>(_changeUrlEvent);
    on<ClearUrlEvent>(_clearUrlEvent);
    on<UploadImageEvent>(_uploadImageEvent);
    on<ChangeSelectedImageEvent>(_changeSelectedImageEvent);
    on<DeleteImageEvent>(_deleteImageEvent);
  }

  static UploadState get initialState => InitialState(
        UploadEntity(),
      );

  void _loadImagesEvent(
    LoadImagesEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(LoadingState(state.uploadEntity));

    final response = await imageRepository.getAll();

    response.fold(
      (failure) {
        emit(
          FailedState(state.uploadEntity),
        );
      },
      (imageList) {
        emit(
          ImageLoadedState(
            state.uploadEntity.copyWith(
              imageList: imageList,
              selectedIndex: 0,
            ),
          ),
        );
      },
    );
  }

  void _changeUrlEvent(ChangeUrlEvent event, Emitter<UploadState> emit) {
    emit(
      UrlChangedState(
        state.uploadEntity.copyWith(
          urlEntity: UrlEntity.dirty(
            event.url.trim(),
          ),
        ),
      ),
    );
  }

  void _clearUrlEvent(ClearUrlEvent event, Emitter<UploadState> emit) {
    emit(
      UrlClearedState(
        state.uploadEntity.copyWith(
          urlEntity: const UrlEntity.dirty(''),
        ),
      ),
    );
  }

  void _uploadImageEvent(
    UploadImageEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(LoadingState(state.uploadEntity));

    final url = state.uploadEntity.urlEntity.value;
    final response = await imageRepository.upload(url);

    response.fold(
      (failure) {
        if (failure is InvalidUrlFailure) {
          emit(
            InvalidUrlState(state.uploadEntity),
          );
        } else if (failure is InternetFailure) {
          emit(
            NoInternetConnectionState(state.uploadEntity),
          );
        } else {
          emit(
            FailedState(state.uploadEntity),
          );
        }
      },
      (image) {
        final List<ImageEntity> imageList = [
          ...state.uploadEntity.imageList,
          image,
        ];

        add(ClearUrlEvent());

        emit(
          ImageLoadedState(
            state.uploadEntity.copyWith(
              imageList: imageList,
              selectedIndex: imageList.length - 1,
            ),
          ),
        );
      },
    );
  }

  void _changeSelectedImageEvent(
    ChangeSelectedImageEvent event,
    Emitter<UploadState> emit,
  ) {
    emit(
      SelectedImageChangedState(
        state.uploadEntity.copyWith(
          selectedIndex: event.index,
        ),
      ),
    );
  }

  void _deleteImageEvent(
    DeleteImageEvent event,
    Emitter<UploadState> emit,
  ) async {
    emit(LoadingState(state.uploadEntity));

    final response = await imageRepository.delete(event.image.uuid);

    response.fold(
      (failure) {
        emit(
          FailedState(state.uploadEntity),
        );
      },
      (_) {
        final List<ImageEntity> imageList = state.uploadEntity.imageList
            .where((element) => element.uuid != event.image.uuid)
            .toList();

        emit(
          ImageLoadedState(
            state.uploadEntity.copyWith(
              imageList: imageList,
              selectedIndex: imageList.length - 1,
            ),
          ),
        );
      },
    );
  }
}
