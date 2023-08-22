import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/bloc/get_players/get_all_players_cubit.dart';
import 'package:studio_flutter/presentation/main_screen.dart';
import 'package:studio_flutter/repository/player_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBA Players',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) =>
              GetAllPlayerCubit(repository: PlayerRepository(Dio())),
          child: const PlayerList()),
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
  }

  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}
