import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/src/injector.dart';
import 'package:studio_flutter/src/presentation/bloc/get_player_search/get_player_search_cubit.dart';
import 'package:studio_flutter/src/presentation/views/player_detail_page.dart';

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
