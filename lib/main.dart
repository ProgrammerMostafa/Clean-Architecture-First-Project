import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/services.dart';
import 'movies/presentation/controller/movies_bloc.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLactor().init();
  ///////////////////////
  runApp(
    BlocProvider<MoviesBloc>(
      create: (context) => MoviesBloc(getIt()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
