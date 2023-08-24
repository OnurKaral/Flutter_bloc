import 'package:studio_flutter/src/domain/entities/PlayerResponseEntity.dart';

abstract class PlayersRepository {
  Future<PlayerResponseEntity> getAllPlayers();
}
