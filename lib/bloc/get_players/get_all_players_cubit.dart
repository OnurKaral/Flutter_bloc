import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studio_flutter/data/model/player_response/player_response.dart';
import 'package:studio_flutter/repository/player_repository.dart';

part 'get_all_players_event.dart';
part 'get_all_players_state.dart';

class GetAllPlayerCubit extends Cubit<GetAllPlayersState> {
  GetAllPlayerCubit({required this.repository})
      : super(GetAllPlayersInitial()) {
    getAllPlayers();
  }

  final PlayerRepository repository;

  void getAllPlayers() async {
    try {
      emit(GetAllPlayersLoading());
      final players = await repository.getAllPlayers();

      emit(GetAllPlayersSuccess(players));
    } catch (e) {
      emit(const GetAllPlayersFail('Bir hata oluştu'));
    }
  }
}
