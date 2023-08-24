import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studio_flutter/src/data/model/player_response/player_response.dart';
import 'package:studio_flutter/src/domain/usecases/get_all_player_usecase.dart';
import 'package:studio_flutter/src/injector.dart';

part 'get_all_players_state.dart';

class GetAllPlayerCubit extends Cubit<GetAllPlayersState> {
  GetAllPlayerCubit() : super(GetAllPlayersInitial()) {
    getAllPlayers();
  }

  Future<void> getAllPlayers() async {
    try {
      emit(GetAllPlayersLoading());
      final players = await injector<GetAllPlayerUseCase>().getAllPlayers();

      emit(GetAllPlayersSuccess(players));
    } catch (e) {
      emit(const GetAllPlayersFail('Bir hata oluştu'));
    }
  }
}
