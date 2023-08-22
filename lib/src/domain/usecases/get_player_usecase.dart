import 'package:studio_flutter/src/data/model/player_response/player.dart';
import 'package:studio_flutter/src/domain/repository/player_repository.dart';

class GetPlayerSearchUseCase {
  late final PlayerRepository repository;

  GetPlayerSearchUseCase(this.repository);

  Future<Player?> getPlayerSearch(String playerName) {
    return repository.getPlayerSearch(playerName);
  }
}
