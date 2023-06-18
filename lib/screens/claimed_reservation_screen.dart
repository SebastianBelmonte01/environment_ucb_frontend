import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/data/Navbar/items.dart';
import 'package:environment_ucb/screens/information_claim_admin_screen.dart';
import 'package:environment_ucb/screens/information_claim_pending_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

import '../cubit/aproved_request_cubit/aproved_request_cubit.dart';

bool flag = true;

class MyClaimedReservationScreen extends StatefulWidget {
  const MyClaimedReservationScreen({super.key});

  @override
  State<MyClaimedReservationScreen> createState() =>
      _MyClaimedReservationScreenState();
}

class _MyClaimedReservationScreenState
    extends State<MyClaimedReservationScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AprovedRequestCubit>(context).getMyAprovedRequest();
    final List<BottomNavItem> _bottomNavItems =
        NavItems().bottomNavItemsProfessor;
    return Scaffold(
      appBar: MyAppBar(
        // ignore: dead_code
        text:
            flag ? "Mis Reclamos \n Respondidos" : "Mis Reclamos \n Pendientes",
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
        bottunColor: flag ? AppTheme.primary : AppTheme.alert,
        borderColor: flag ? AppTheme.primary : AppTheme.alert,
        onPressed: () {
          flag
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyInformationClaimScreen()))
              : Navigator.pushNamed(context, '/claimScreen');
        },
      ),
      floatingActionButton: GFToggle(
        onChanged: (value) {
          setState(() {
            flag = value!;
          });
        },
        value: flag,
        type: GFToggleType.ios,
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 4),
    );
  }
}
