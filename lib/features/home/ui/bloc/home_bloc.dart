import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_from_url/features/home/domain/entities/home_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(initialState) {
    on<ChangeTabEvent>(_changeTabEvent);
  }

  static HomeState get initialState => InitialState(
        HomeEntity(),
      );

  void _changeTabEvent(ChangeTabEvent event, Emitter<HomeState> emit) {
    emit(
      TabChangedState(
        state.homeEntity.copyWith(
          tabIndex: event.index,
        ),
      ),
    );
  }
}
