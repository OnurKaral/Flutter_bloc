import 'package:studio_flutter/src/domain/entities/PlayerEntity.dart';
import 'package:studio_flutter/src/domain/repository/players_repository.dart';

class GetPlayerSearchUseCase {
  GetPlayerSearchUseCase(this.repository);

  final PlayersRepository repository;

  Future<PlayerEntity> getPlayer(String playerName) {
    return repository.getPlayerSearch(playerName);
  }
}
