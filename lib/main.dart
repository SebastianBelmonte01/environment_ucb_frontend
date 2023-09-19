import 'package:environment_ucb/cubit/claim_cubit/claim_cubit.dart';
import 'package:environment_ucb/cubit/entrance_cubit/entrance_cubit.dart';
import 'package:environment_ucb/cubit/environment_cubit/environment_cubit.dart';
import 'package:environment_ucb/cubit/login_cubit/login_cubit.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/cubit/professor_cubit/professor_cubit.dart';
import 'package:environment_ucb/cubit/registration_cubit/registration_cubit.dart';
import 'package:environment_ucb/cubit/request_cubit/request_cubit.dart';
import 'package:environment_ucb/screens/aproved_reservation_screen.dart';
import 'package:environment_ucb/screens/information_finished_reservation_screen.dart';
import 'package:environment_ucb/screens/claimed_reservation_admin_screen.dart';
import 'package:environment_ucb/screens/claimed_state_reservation_screen.dart';
import 'package:environment_ucb/screens/finished_reservation_screen.dart';
import 'package:environment_ucb/screens/image_claim_screen.dart';
import 'package:environment_ucb/screens/information_claim_admin_screen.dart';
import 'package:environment_ucb/screens/information_reservation_admin_screen%20.dart';
import 'package:environment_ucb/screens/information_reservation_screen.dart';
import 'package:environment_ucb/screens/login_screen.dart';
import 'package:environment_ucb/screens/pending_reservations_screen.dart';
import 'package:environment_ucb/screens/pending_request_admin_screen.dart';
import 'package:environment_ucb/screens/registration_screen.dart';
import 'package:environment_ucb/screens/rejected_reservation_screen.dart';
import 'package:environment_ucb/screens/request_message.dart';
import 'package:environment_ucb/screens/request_screen.dart';
import 'package:environment_ucb/screens/strike_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'cubit/aproved_request_cubit/aproved_request_cubit.dart';

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
          BlocProvider<RegistrationCubit>(
            create: (context) => RegistrationCubit(),
          ),
          BlocProvider<EnvironmentCubit>(
            create: (context) => EnvironmentCubit()..getEnvironments(),
          ),
          BlocProvider<ProfessorCubit>(
            create: (context) => ProfessorCubit()..getProfessor(),
          ),
          BlocProvider<RequestCubit>(
            create: (context) => RequestCubit(),
          ),
          BlocProvider<PendingRequestCubit>(
            create: (context) => PendingRequestCubit(),
          ),
          BlocProvider<AprovedRequestCubit>(
            create: (context) => AprovedRequestCubit()..getMyAprovedRequest(),
          ),
          BlocProvider<EntranceCubit>(create: (context) => EntranceCubit()),
          BlocProvider<ClaimCubit>(create: (context) => ClaimCubit())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => AnimatedSplashScreen(splash:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/UCB_logo.png')
                ]), 
              nextScreen: MyLoginScreen(),
              splashIconSize: 600, 
              splashTransition: SplashTransition.fadeTransition,
              duration: 500,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
            ),
            '/registration':(context) => MyRegistrationScreen(),
            '/requestScreen': (context) => MyRequestScreen(),
            '/requestMessageScreen': (context) => MyRequestMessageScreen(),
            '/rejectedScreen': (context) => MyRejectedRequestScreen(),
            '/pendingScreen': (context) => MyPendingRequestScreen(),
            '/aprovedScreen': (context) => MyAprovedReservationScreen(),
            '/infoScreen': (context) => MyInformationReservationScreen(),
            '/pendingAdminScreen': (context) => MyPendingRequestAdminScreen(),
            '/informationRequestAdminScreen': (context) =>
                MyInformationReservationAdminScreen(),
            '/finishedScreen': (context) => MyFinishedReservationScreen(),
            '/claimScreen': (context) => MyClaimReservationScreen(),
            '/informationClaimScreen': (context) =>
                MyInformationClaimAdminScreen(),
            '/imageClaimScreen': (context) => MyImageClaimScreen(),
            '/strikeAdminScreen': (context) => MyStrikeAdminScreen(),
            '/claimedAdminScreen': (context) =>
                MyClaimedAdminReservationScreen(),
            '/claimedScreen': (context) => MyClaimScreen(),

          },
        ));
  }
}
