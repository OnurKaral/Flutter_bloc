import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studio_flutter/src/domain/entities/PlayerResponseEntity.dart';
import 'package:studio_flutter/src/domain/usecases/get_all_player_usecase.dart';

part 'get_all_players_state.dart';

class GetAllPlayerCubit extends Cubit<GetAllPlayersState> {
  GetAllPlayerCubit(this.useCase) : super(GetAllPlayersInitial()) {
    getAllPlayers();
  }

  final GetAllPlayerUseCase useCase;

  Future<void> getAllPlayers() async {
    try {
      emit(GetAllPlayersLoading());
      final players = await useCase.getAllPlayers();

      emit(GetAllPlayersSuccess(players));
    } catch (e) {
      emit(const GetAllPlayersFail('Bir hata oluştu'));
    }
  }
}
