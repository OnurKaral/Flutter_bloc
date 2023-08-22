part of 'get_player_bloc.dart';

abstract class GetPlayerEvent extends Equatable {
  const GetPlayerEvent();

  @override
  List<Object?> get props => [];
}

class OnGetPlayerEvent extends GetPlayerEvent {
  const OnGetPlayerEvent();
}
