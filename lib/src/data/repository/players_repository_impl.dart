import 'package:studio_flutter/src/data/remote/api_service.dart';
import 'package:studio_flutter/src/domain/entities/PlayerEntity.dart';
import 'package:studio_flutter/src/domain/entities/PlayerResponseEntity.dart';
import 'package:studio_flutter/src/domain/repository/players_repository.dart';

class PlayersRepositoryImpl implements PlayersRepository {
  PlayersRepositoryImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<PlayerResponseEntity> getAllPlayers() async {
    try {
      final response = await apiService.getAllPlayers();
      final entity = response.toEntity();
      return entity;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PlayerEntity> getPlayerSearch(String playerName) async {
    try {
      final response = await apiService.getPlayerSearch(playerName);
      final entity = response!.toEntity();
      return entity;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PlayerEntity> getPlayer(int playerId) async {
    try {
      final response = await apiService.getPlayer(playerId);
      final entity = response.toEntity();
      return entity;
    } catch (e) {
      rethrow;
    }
  }
}
