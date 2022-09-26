import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/features/app_config/domain/entities/app_config_entity.dart';
import 'package:image_gallery_from_url/features/app_config/domain/repositories/app_config_repository.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final AppConfigRepository appConfigRepository;

  AppConfigBloc(this.appConfigRepository) : super(initialState()) {
    on<LoadCredentialsEvent>(_loadCredentialsEvent);
  }

  static AppConfigState initialState() => InitialState(
        AppConfigEntity(),
      );

  void _loadCredentialsEvent(
    LoadCredentialsEvent event,
    Emitter<AppConfigState> emit,
  ) async {
    emit(LoadingState(state.appConfigEntity));

    final response = await appConfigRepository.checkUserIsLogged();

    response.fold(
      (l) => emit(FailedState(state.appConfigEntity)),
      (isLogged) => emit(
        LoadedState(
          state.appConfigEntity.copyWith(
            islogged: isLogged,
          ),
        ),
      ),
    );
  }
}
