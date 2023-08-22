import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studio_flutter/data/model/player_response/player.dart';
import 'package:studio_flutter/repository/player_repository.dart';

part 'get_player_event.dart';
part 'get_player_state.dart';

class GetPlayerCubit extends Cubit<GetPlayerState> {
  GetPlayerCubit({required this.repository}) : super(GetPlayerInitial());
  final PlayerRepository repository;

  void getPlayer(int playerId) async {
    try {
      emit(GetPlayerLoading());
      final player = await repository.getPlayer(playerId);

      emit(GetPlayerSuccess(player));
    } catch (e) {
      emit(const GetPlayerFail('Bir hata oluştu'));
    }
  }
}