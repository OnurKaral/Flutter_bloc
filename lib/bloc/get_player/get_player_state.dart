part of 'get_player_bloc.dart';

abstract class GetPlayerState extends Equatable {
  const GetPlayerState();

  @override
  List<Object?> get props => [];
}

class GetPlayerInitial extends GetPlayerState {}

class GetPlayerLoading extends GetPlayerState {}

class GetPlayerSuccess extends GetPlayerState {
  const GetPlayerSuccess(this.response);

  final Player response;

  @override
  List<Object?> get props => [response];
}

class GetPlayerFail extends GetPlayerState {
  const GetPlayerFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
