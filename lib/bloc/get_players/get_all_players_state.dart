part of 'get_all_players_bloc.dart';

abstract class GetAllPlayersState extends Equatable {
  const GetAllPlayersState();

  @override
  List<Object?> get props => [];
}

class GetAllPlayersInitial extends GetAllPlayersState {}

class GetAllPlayersLoading extends GetAllPlayersState {}

class GetAllPlayersSuccess extends GetAllPlayersState {
  const GetAllPlayersSuccess(this.response);

  final AllPlayersResponse response;

  @override
  List<Object?> get props => [response];
}

class GetAllPlayersFail extends GetAllPlayersState {
  const GetAllPlayersFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
