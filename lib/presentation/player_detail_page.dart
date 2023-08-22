import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/repository/player_repository.dart';

import '../bloc/get_player/get_player_cubit.dart';

class PlayerDetailPage extends StatelessWidget {
  final int playerId;

  const PlayerDetailPage({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPlayerCubit(repository: PlayerRepository(Dio())),
      child: Player(
        playerId: playerId,
      ),
    );
  }
}

class Player extends StatefulWidget {
  final int playerId;

  const Player({super.key, required this.playerId});

  @override
  State<Player> createState() => _Player();
}

class _Player extends State<Player> {
  @override
  initState() {
    super.initState();
    context.read<GetPlayerCubit>().getPlayer(widget.playerId);
  }

  @override
  Widget build(BuildContext context) {
    return const _PlayerDetail();
  }
}

class _PlayerDetail extends StatelessWidget {
  const _PlayerDetail();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<GetPlayerCubit, GetPlayerState>(
              builder: (context, state) {
                if (state is GetPlayerLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GetPlayerSuccess) {
                  return SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Player Details',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Name: ${state.response.firstName}${state.response.lastName}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Team: ${state.response.team?.name}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Team City: ${state.response.team?.city}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Position: ${state.response.position}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (state is GetPlayerFail) {
                  return Text(state.message);
                } else if (state is GetPlayerInitial) {
                  return const Text('Lütfen Butona Basınız.');
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
