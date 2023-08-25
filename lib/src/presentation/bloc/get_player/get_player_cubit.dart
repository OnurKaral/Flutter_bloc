import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studio_flutter/src/domain/entities/PlayerEntity.dart';
import 'package:studio_flutter/src/domain/usecases/get_player_usecase.dart';

part 'get_player_state.dart';

class GetPlayerCubit extends Cubit<GetPlayerState> {
  GetPlayerCubit(this.useCase) : super(GetPlayerInitial());

  final GetPlayerUseCase useCase;

  Future<void> getPlayer(int playerId) async {
    try {
      emit(GetPlayerLoading());
      final player = await useCase.getPlayer(playerId);

      emit(GetPlayerSuccess(player));
    } catch (e) {
      emit(const GetPlayerFail('Bir hata oluştu'));
    }
  }
}
