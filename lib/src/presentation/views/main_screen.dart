import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/src/presentation/bloc/get_players/get_all_players_cubit.dart';
import 'package:studio_flutter/src/presentation/views/player_detail_page.dart';
import 'package:studio_flutter/src/presentation/views/player_search_detail_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC')),
      body: Center(
        child: BlocBuilder<GetAllPlayerCubit, GetAllPlayersState>(
          builder: (context, state) {
            if (state is GetAllPlayersLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetAllPlayersSuccess) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        // Add a clear button to the search bar
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => _searchController.clear(),
                        ),
                        // Add a search icon or button to the search bar
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        _searchController.text = value;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PlayerSearchDetailPage(
                              playerName: _searchController.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
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
                  ),
                ],
              );
            } else if (state is GetAllPlayersFail) {
              return Text(state.message);
            } else if (state is GetAllPlayersInitial) {
              return const Text('Lütfen Butona Basınız.');
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
