import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/aproved_request_cubit/aproved_request_cubit.dart';

class MyFinishedReservationScreen extends StatelessWidget {
  const MyFinishedReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AprovedRequestCubit>(context).getMyAprovedRequest();

    final List<BottomNavItem> _bottomNavItems = [
      BottomNavItem(
          icon: Icons.access_time,
          label: 'Pendiente',
          route: '/pendingAdminScreen'),
      BottomNavItem(
          icon: Icons.arrow_drop_down_circle_outlined,
          label: 'Reclamos',
          route: '/claimedAdminScreen'),
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
          Navigator.pushNamed(context, 'informationClaimScreen');
        },
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 1),
    );
  }
}
