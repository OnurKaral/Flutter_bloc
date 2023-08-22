import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/bloc/get_players/get_all_players_bloc.dart';
import 'package:studio_flutter/player_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllPlayerBloc(),
      child: MaterialApp(
        title: 'NBA Players',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
        ),
        home: const PlayerList(),
      ),
    );
  }
}

class PlayerList extends StatefulWidget {
  const PlayerList({super.key});

  @override
  State<PlayerList> createState() => _PlayerList();
}

class _PlayerList extends State<PlayerList> {
  @override
  initState() {
    super.initState();
    context.read<GetAllPlayerBloc>().add(const OnGetAllPlayerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const _PlayerListScreen();
  }
}

class _PlayerListScreen extends StatelessWidget {
  const _PlayerListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<GetAllPlayerBloc, GetAllPlayersState>(
              builder: (context, state) {
                if (state is GetAllPlayersLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GetAllPlayersSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemCount: state.response.data.length,
                      itemBuilder: (context, index) {
                        final player = state.response.data[index];

                        return ListTile(
                          title: Text('${player.firstName} ${player.lastName}'),
                          subtitle: Text('Position: ${player.position}'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PlayerDetailPage(
                                  playerId: player.id,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (state is GetAllPlayersFail) {
                  return Text(state.message);
                } else if (state is GetAllPlayersInitial) {
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
