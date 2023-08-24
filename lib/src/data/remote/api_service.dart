import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:studio_flutter/src/data/model/player_response/player_response.dart';
import 'package:studio_flutter/src/injector.dart';
import 'package:studio_flutter/src/utils/constants.dart';

class ApiService {
  final client = injector<Dio>();

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
}
