import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:studio_flutter/bloc/get_player/get_player_cubit.dart';
import 'package:studio_flutter/bloc/get_players/get_all_players_cubit.dart';
import 'package:studio_flutter/repository/player_repository.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(() => Dio());

  injector.registerLazySingleton(
      () => GetPlayerCubit(repository: PlayerRepository()));
  injector.registerLazySingleton(
      () => GetAllPlayerCubit(repository: PlayerRepository()));
}
