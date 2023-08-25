import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:studio_flutter/src/data/remote/api_service.dart';
import 'package:studio_flutter/src/data/repository/players_repository_impl.dart';
import 'package:studio_flutter/src/domain/repository/players_repository.dart';
import 'package:studio_flutter/src/domain/usecases/get_all_player_usecase.dart';
import 'package:studio_flutter/src/domain/usecases/get_player_search_usecase.dart';
import 'package:studio_flutter/src/domain/usecases/get_player_usecase.dart';
import 'package:studio_flutter/src/presentation/bloc/get_player/get_player_cubit.dart';
import 'package:studio_flutter/src/presentation/bloc/get_player_search/get_player_search_cubit.dart';
import 'package:studio_flutter/src/presentation/bloc/get_players/get_all_players_cubit.dart';

final injector = GetIt.instance;

Future<void> setup() async {
  injector
    ..registerLazySingleton(Dio.new)

    //Repository
    ..registerLazySingleton(ApiService.new)
    ..registerLazySingleton<PlayersRepository>(
        () => PlayersRepositoryImpl(apiService: injector()))

    //UseCases
    ..registerLazySingleton(() => GetAllPlayerUseCase(injector()))
    ..registerLazySingleton(() => GetPlayerUseCase(injector()))
    ..registerLazySingleton(() => GetPlayerSearchUseCase(injector()))

    //Cubits
    ..registerFactory(() => GetPlayerCubit(injector()))
    ..registerFactory(() => GetPlayerSearchCubit(injector()))
    ..registerFactory(() => GetAllPlayerCubit(injector()));
}
