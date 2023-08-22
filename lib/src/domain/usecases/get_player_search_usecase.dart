import 'package:studio_flutter/src/data/model/player_response/player.dart';
import 'package:studio_flutter/src/domain/repository/player_repository.dart';

class GetPlayerUseCase {
  late final PlayerRepository repository;

  GetPlayerUseCase(this.repository);

  Future<Player> getPlayers(int playerId) {
    return repository.getPlayer(playerId);
  }
}
