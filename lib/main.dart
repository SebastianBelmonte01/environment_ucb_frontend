import 'package:environment_ucb/cubit/login_cubit/login_cubit.dart';
import 'package:environment_ucb/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        )
      ], child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
        },
      )
    );
  }
}