import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_gallery_from_url/di/local_database.dart';
import 'package:image_gallery_from_url/features/login/data/repositories/auth_repository_impl.dart';
import 'package:image_gallery_from_url/features/login/domain/repositories/auth_repository.dart';
import 'package:image_gallery_from_url/features/login/ui/bloc/login_bloc.dart';
import 'package:image_gallery_from_url/features/upload/data/repositories/image_repository_impl.dart';
import 'package:image_gallery_from_url/features/upload/domain/repositories/image_repository.dart';
import 'package:image_gallery_from_url/features/upload/ui/bloc/upload_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

GetIt sl = GetIt.instance;

Future<void> diInit() async {
  await _registerLocal();

  _registerNetwork();

  _registerRepositories();

  _registerBlocs();
}

// Local
Future<void> _registerLocal() async {
  final localDataBase = await LocalDataBase.init();

  sl.registerLazySingleton<Database>(() => localDataBase);
  sl.registerLazySingleton<Uuid>(() => const Uuid());
}

// Network
void _registerNetwork() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}

// Repositories
void _registerRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );
  sl.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(sl(), sl(), sl(), sl()),
  );
}

// Blocs
void _registerBlocs() {
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => UploadBloc(sl()));
}
