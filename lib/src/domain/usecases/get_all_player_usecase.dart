import 'package:studio_flutter/src/domain/entities/PlayerResponseEntity.dart';
import 'package:studio_flutter/src/domain/repository/players_repository.dart';

class GetAllPlayerUseCase {
  final PlayersRepository repository;

  GetAllPlayerUseCase(this.repository);

  Future<PlayerResponseEntity> getAllPlayers() {
    return repository.getAllPlayers();
  }
}
