import 'package:studio_flutter/src/data/model/player_response/player_response.dart';
import 'package:studio_flutter/src/domain/repository/player_repository.dart';

class GetAllPlayerUseCase {
  late final PlayerRepository repository;
  GetAllPlayerUseCase(this.repository);

  Future<PlayerResponse> call() async {
    return await repository.getAllPlayers();
  }
}