import 'package:environment_ucb/cubit/login_cubit/login_cubit.dart';
import 'package:environment_ucb/cubit/professor_cubit/professor_cubit.dart';
import 'package:environment_ucb/screens/aproved_reservation_screen.dart';
import 'package:environment_ucb/screens/information_reservation_screen.dart';
import 'package:environment_ucb/screens/login_screen.dart';
import 'package:environment_ucb/screens/pending_reservations_screen.dart';
import 'package:environment_ucb/screens/request_message.dart';
import 'package:environment_ucb/screens/request_screen.dart';
import 'package:flutter/material.dart';
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
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<ProfessorCubit>(
            create: (context) => ProfessorCubit()..getProfessor(),
          )
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => MyLoginScreen(),
            '/requestScreen': (context) => MyRequestScreen(),
            '/requestMessageScreen': (context) => MyRequestMessageScreen(),
            '/pendingScreen': (context) => MyPendingRequestScreen(),
            '/aprovedScreen': (context) => MyAprovedReservationScreen(),
            '/infoScreen': (context) => MyInformationReservationScreen(),
          },
        ));
  }
}
