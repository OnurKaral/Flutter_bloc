import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/bloc/get_players/get_all_players_cubit.dart';
import 'package:studio_flutter/presentation/player_detail_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<GetAllPlayerCubit, GetAllPlayersState>(
              builder: (context, state) {
                if (state is GetAllPlayersLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GetAllPlayersSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemCount: state.response.data?.length,
                      itemBuilder: (context, index) {
                        final player = state.response.data?[index];

                        return ListTile(
                          title:
                              Text('${player?.firstName} ${player?.lastName}'),
                          subtitle: Text('Position: ${player?.position}'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PlayerDetailPage(
                                  playerId: player!.id!,
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
