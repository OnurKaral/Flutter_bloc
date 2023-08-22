part of 'get_all_players_bloc.dart';

abstract class GetAllPlayerEvent extends Equatable {
  const GetAllPlayerEvent();

  @override
  List<Object?> get props => [];
}

class OnGetAllPlayerEvent extends GetAllPlayerEvent {
  const OnGetAllPlayerEvent();
}
