import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:studio_flutter/data/model/player_response/player.dart';
import 'package:studio_flutter/data/model/player_response/player_response.dart';
import 'package:studio_flutter/utils/constants.dart';

class PlayerRepository {
  const PlayerRepository(this.client);

  final Dio client;

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
}
