import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:studio_flutter/src/data/repository/player_repository.dart';
import 'package:studio_flutter/src/presentation/bloc/get_player/get_player_cubit.dart';
import 'package:studio_flutter/src/presentation/bloc/get_players/get_all_players_cubit.dart';

final injector = GetIt.instance;

void setup() {
  injector
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(
        () => GetPlayerCubit(repository: PlayerRepository()))
    ..registerLazySingleton(
        () => GetAllPlayerCubit(repository: PlayerRepository()));
}
