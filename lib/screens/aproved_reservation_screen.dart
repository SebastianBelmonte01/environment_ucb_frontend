import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/dto/reservation_dto.dart';
import 'package:environment_ucb/screens/information_reservation_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/pending_request_cubit/pending_request_cubit.dart';
import '../dto/request_dto.dart';

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
      body: BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return ListView.builder(
                  itemCount: state.reservationList?.length,
                  itemBuilder: (context, index) {
                    ReservationDto? request = state.reservationList?[index];
                    return MyReservationCard(
                      environment: request?.environment as String,
                      subject: request!.subject.toString(),
                      parallel: request.parallel.toString(),
                      date: request.reservationDate!,
                      time: request.reservationTimeInit as String,
                      bottunText: "Ver detalle",
                      bottunColor: Color(0xff2C3E6C),
                      borderColor: Colors.black12,
                      onPressed: () {
                        BlocProvider.of<AprovedRequestCubit>(context).setSelectedReservation(request);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyInformationReservationScreen()));
                      },
                    );
                  },
              );
        },
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 1),
    );
  }
}
