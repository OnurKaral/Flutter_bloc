import 'package:studio_flutter/src/domain/entities/PlayerEntity.dart';
import 'package:studio_flutter/src/domain/entities/PlayerResponseEntity.dart';

abstract class PlayersRepository {
  Future<PlayerResponseEntity> getAllPlayers();

  Future<PlayerEntity> getPlayer(int playerId);

  Future<PlayerEntity> getPlayerSearch(String playerName);
}
