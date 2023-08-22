import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/presentation/player_detail_page.dart';
import 'package:studio_flutter/repository/player_repository.dart';

import '../bloc/get_player/get_player_cubit.dart';

class PlayerSearchDetailPage extends StatelessWidget {
  final String playerName;

  const PlayerSearchDetailPage({super.key, required this.playerName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPlayerCubit(repository: PlayerRepository()),
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
    context.read<GetPlayerCubit>().getPlayerSearch(widget.playerName);
  }

  @override
  Widget build(BuildContext context) {
    return const PlayerDetailPageWidget();
  }
}
