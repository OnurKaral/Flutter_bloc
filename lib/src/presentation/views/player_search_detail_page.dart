import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/src/injector.dart';
import 'package:studio_flutter/src/presentation/bloc/get_player_search/get_player_search_cubit.dart';

class PlayerSearchDetailPage extends StatelessWidget {
  final String playerName;

  const PlayerSearchDetailPage({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<GetPlayerSearchCubit>(),
      child: Player(
        playerName: playerName,
      ),
    );
  }
}

class Player extends StatefulWidget {
  final String playerName;

  const Player({super.key, required this.playerName});

  @override
  State<Player> createState() => _Player();
}

class _Player extends State<Player> {
  @override
  initState() {
    super.initState();
    context.read<GetPlayerSearchCubit>().getPlayerSearch(widget.playerName);
  }

  @override
  Widget build(BuildContext context) {
    return const PlayerDetailPageWidget();
  }
}

class PlayerDetailPageWidget extends StatelessWidget {
  const PlayerDetailPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<GetPlayerSearchCubit, GetPlayerSearchState>(
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
                              'Name: ${state.response.firstName} ${state.response.lastName}',
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
