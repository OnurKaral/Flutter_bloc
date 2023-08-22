part of 'get_player_cubit.dart';

abstract class GetPlayerEvent extends Equatable {
  const GetPlayerEvent();

  @override
  List<Object?> get props => [];
}

class OnGetPlayerEvent extends GetPlayerEvent {
  final int playerId;

  const OnGetPlayerEvent(this.playerId);
}