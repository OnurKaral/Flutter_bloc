import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studio_flutter/src/domain/usecases/get_player_usecase.dart';

import '../../../data/model/player_response/player.dart';

part 'get_player_search_state.dart';

class GetPlayerSearchCubit extends Cubit<GetPlayerSearchState> {
  GetPlayerSearchCubit(this.useCase) : super(GetPlayerInitial());

  final GetPlayerSearchUseCase useCase;

  Future<void> getPlayerSearch(String playerName) async {
    try {
      emit(GetPlayerLoading());
      final player = await useCase.getPlayerSearch(playerName);
      emit(GetPlayerSuccess(player!));
    } catch (e) {
      emit(const GetPlayerFail('Bir hata oluştu'));
    }
  }
}
