import 'package:flutter/material.dart';
import 'package:tecapp/Presentation/DetailScreen/bloc/detail_bloc.dart';
import 'package:tecapp/Presentation/HomeScreen/HomeScreen.dart';
import 'package:tecapp/Presentation/HomeScreen/Model/ListModel.dart';
import 'package:tecapp/Presentation/HomeScreen/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(HomeState())..add(HomeInitalEvent()),
        ),
        BlocProvider(
          create: (context) => DetailBloc(DetailState()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tech Jar',
        theme: ThemeData(
          textTheme: TextTheme(
              labelMedium: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.7)),
              labelSmall:
                  TextStyle(fontSize: 12, color: Colors.black.withOpacity(.7))),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 19, 18, 18)),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
