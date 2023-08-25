import 'package:studio_flutter/src/domain/entities/PlayerEntity.dart';
import 'package:studio_flutter/src/domain/repository/players_repository.dart';

class GetPlayerUseCase {
  GetPlayerUseCase(this.repository);

  final PlayersRepository repository;

  Future<PlayerEntity> getPlayer(int playerId) {
    return repository.getPlayer(playerId);
  }
}
