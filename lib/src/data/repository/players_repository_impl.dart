import 'package:studio_flutter/src/data/remote/api_service.dart';
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
}
