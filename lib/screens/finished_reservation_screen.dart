import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/screens/claim_reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/aproved_request_cubit/aproved_request_cubit.dart';
import '../dto/reservation_dto.dart';
import 'information_reservation_rejection_screen.dart';
import 'information_reservation_screen.dart';

class MyFinishedReservationScreen extends StatelessWidget {
  const MyFinishedReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AprovedRequestCubit>(context).getMyAprovedRequest();

    final List<BottomNavItem> _bottomNavItems = [
      BottomNavItem(
          icon: Icons.access_time, label: 'Pendiente', route: '/pendingScreen'),
      BottomNavItem(
          icon: Icons.check_box, label: 'Aceptado', route: '/aprovedScreen'),
      BottomNavItem(
          icon: Icons.clear_rounded,
          label: 'Rechazado',
          route: '/rejectedScreen'),
      BottomNavItem(
          icon: Icons.safety_check_sharp,
          label: 'Terminado',
          route: '/finishedScreen'),
    ];
    return Scaffold(
      appBar: const MyAppBar(
        text: "Mis Reservas",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: MyReservationCard(
        environment: "Laboratorio 1",
        subject: "Arquitectura de software",
        parallel: "1",
        date: "25/42/14",
        time: "12:30",
        bottunText: "Ver detalle",
        bottunColor: Color.fromRGBO(224, 200, 121, 1),
        borderColor: Colors.black12,
        onPressed: () {
          Navigator.pushNamed(context, '/claimScreen');
        },
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 3),
    );
  }
}
