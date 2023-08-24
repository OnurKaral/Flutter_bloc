part of 'get_player_search_cubit.dart';

abstract class GetPlayerSearchState extends Equatable {
  const GetPlayerSearchState();

  @override
  List<Object?> get props => [];
}

class GetPlayerInitial extends GetPlayerSearchState {}

class GetPlayerLoading extends GetPlayerSearchState {}

class GetPlayerSuccess extends GetPlayerSearchState {
  const GetPlayerSuccess(this.response);

  final Player response;

  @override
  List<Object?> get props => [response];
}

class GetPlayerFail extends GetPlayerSearchState {
  const GetPlayerFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
