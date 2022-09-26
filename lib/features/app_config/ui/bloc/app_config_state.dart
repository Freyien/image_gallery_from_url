part of 'app_config_bloc.dart';

@immutable
abstract class AppConfigState {
  final AppConfigEntity appConfigEntity;

  const AppConfigState(this.appConfigEntity);
}

class InitialState extends AppConfigState {
  const InitialState(super.appConfigEntity);
}

class LoadingState extends AppConfigState {
  const LoadingState(super.appConfigEntity);
}

class LoadedState extends AppConfigState {
  const LoadedState(super.appConfigEntity);
}

class FailedState extends AppConfigState {
  const FailedState(super.appConfigEntity);
}
