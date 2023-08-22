import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:studio_flutter/src/domain/repository/player_repository.dart';
import 'package:studio_flutter/src/domain/usecases/get_all_player_usecase.dart';
import 'package:studio_flutter/src/presentation/bloc/get_player/get_player_cubit.dart';
import 'package:studio_flutter/src/presentation/bloc/get_players/get_all_players_cubit.dart';

final injector = GetIt.instance;

void setup() {
  injector
    ..registerLazySingleton(Dio.new)

    //Repository
    ..registerLazySingleton(
            () => PlayerRepository())

    //UseCases
    ..registerLazySingleton(
            () => GetAllPlayerUseCase(injector<PlayerRepository>()))

    //Cubits
    ..registerLazySingleton(
            () => GetPlayerCubit(repository: PlayerRepository()))
    ..registerLazySingleton(
            () => GetAllPlayerCubit(useCase: injector<GetAllPlayerUseCase>()));

}
