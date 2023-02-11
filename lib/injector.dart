import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:anakmuslimapp/data/data_sources/remote/anakmuslim_remote_data_source.dart';
import 'package:anakmuslimapp/data/repositories/anakmuslim_repository_impl.dart';
import 'package:anakmuslimapp/domain/repositories/anakmuslim_repository.dart';
import 'package:anakmuslimapp/domain/use_cases/fetch_anakmuslim_use_case.dart';
import 'package:anakmuslimapp/presentation/blocs/bloc/anakmuslim_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [AnakMuslimBloc].
  sl.registerFactory(() => AnakMuslimBloc(fetchAnakMuslimUseCase: sl()));

  // usecases
  // registering service locator for [FetchAnakMuslimUseCase].
  sl.registerLazySingleton(
      () => FetchAnakMuslimUseCase(anakmuslimRepository: sl()));

  // repositories
  // registering service locator for [AnakMuslimRepository].
  sl.registerLazySingleton<AnakMuslimRepository>(
      () => AnakMuslimRepositoryImpl(anakmuslimRemoteDataSource: sl()));

  // datasources
  // registering service locator for [AnakMuslimRemoteDataSource].
  sl.registerLazySingleton<AnakMuslimRemoteDataSource>(
      () => AnakMuslimRemoteDataSourceImpl(dio: sl()));

  // external
  // registering service locator for [Dio()].
  sl.registerLazySingleton(() => Dio());
}
