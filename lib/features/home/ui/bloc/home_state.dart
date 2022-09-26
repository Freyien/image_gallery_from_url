part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final HomeEntity homeEntity;

  const HomeState(this.homeEntity);
}

class InitialState extends HomeState {
  const InitialState(super.homeEntity);
}

class TabChangedState extends HomeState {
  const TabChangedState(super.homeEntity);
}
