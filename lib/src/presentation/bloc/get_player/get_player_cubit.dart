import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studio_flutter/src/domain/usecases/get_player_search_usecase.dart';
import 'package:studio_flutter/src/domain/usecases/get_player_usecase.dart';
import 'package:studio_flutter/src/injector.dart';

import '../../../data/model/player_response/player.dart';

part 'get_player_event.dart';
part 'get_player_state.dart';

class GetPlayerCubit extends Cubit<GetPlayerState> {
  GetPlayerCubit() : super(GetPlayerInitial());

  void getPlayer(int playerId) async {
    try {
      emit(GetPlayerLoading());
      final player = await injector<GetPlayerUseCase>().getPlayers(playerId);

      emit(GetPlayerSuccess(player));
    } catch (e) {
      emit(const GetPlayerFail('Bir hata oluştu'));
    }
  }

  void getPlayerSearch(String playerName) async {
    try {
      emit(GetPlayerLoading());
      final player =
          await injector<GetPlayerSearchUseCase>().getPlayerSearch(playerName);
      emit(GetPlayerSuccess(player!));
    } catch (e) {
      emit(const GetPlayerFail('Bir hata oluştu'));
    }
  }
}
