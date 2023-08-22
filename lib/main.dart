import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_flutter/src/injector.dart';
import 'package:studio_flutter/src/presentation/bloc/get_players/get_all_players_cubit.dart';
import 'package:studio_flutter/src/presentation/views/main_screen.dart';

Future<void> main() async {
  setup();
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
          create: (context) => injector<GetAllPlayerCubit>(),
          child: const MainScreen()),
    );
  }
}
