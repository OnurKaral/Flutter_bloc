import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:studio_flutter/src/core/utils/constants.dart';
import 'package:studio_flutter/src/data/model/player_response/player_response.dart';
import 'package:studio_flutter/src/injector.dart';

import '../../data/model/player_response/player.dart';

class PlayerRepository {
  final Dio client = injector<Dio>();

  Future<PlayerResponse> getAllPlayers() async {
    try {
      client.interceptors.add(PrettyDioLogger());

      final response = await client.get(
        "${Constants.BASE_URL}players",
      );

      PlayerResponse allPlayers = PlayerResponse.fromJson(response.data);

      return allPlayers;
    } catch (e) {
      rethrow;
    }
  }

  Future<Player> getPlayer(int playerId) async {
    try {
      client.interceptors.add(PrettyDioLogger());

      final response = await client.get(
        "${Constants.BASE_URL}players/$playerId",
      );

      Player player = Player.fromJson(response.data);

      return player;
    } catch (e) {
      rethrow;
    }
  }

  Future<Player?> getPlayerSearch(String playerName) async {
    try {
      client.interceptors.add(PrettyDioLogger());

      final response = await client.get(
        "${Constants.BASE_URL}players?search=$playerName",
      );

      PlayerResponse player = PlayerResponse.fromJson(response.data);

      return player.data?.first;
    } catch (e) {
      rethrow;
    }
  }
}
