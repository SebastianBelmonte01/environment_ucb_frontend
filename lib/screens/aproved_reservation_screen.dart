import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyAprovedReservationScreen extends StatelessWidget {
  const MyAprovedReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
          child: Column(children: [
        myReservationCard(
          environment: "Auditorio",
          subject: "Taller de Programacion",
          parallel: "paralelo 1",
          date: "12/12/2021",
          time: "12:00",
          bottunText: "Detalles",
          bottunColor: AppTheme.secondary,
          borderColor: Colors.black12,
          onPressed: () {
            Navigator.pushNamed(context, '/infoScreen');
          },
        )
      ])),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 1),
    );
  }
}
