import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_gallery_from_url/features/login/data/repositories/auth_repository_impl.dart';
import 'package:image_gallery_from_url/features/login/domain/repositories/auth_repository.dart';
import 'package:image_gallery_from_url/features/login/ui/bloc/login_bloc.dart';

GetIt sl = GetIt.instance;

void diInit() {
  _registerHttpClient();

  _registerRepositories();

  _registerBlocs();
}

// Http Clients
void _registerHttpClient() {
  sl.registerLazySingleton<Dio>(() => Dio());
}

// Repositories
void _registerRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );
}

// Blocs
void _registerBlocs() {
  sl.registerFactory(() => LoginBloc(sl()));
}
