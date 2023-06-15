import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/cubit/request_cubit/request_cubit.dart';
import 'package:environment_ucb/dto/request_dto.dart';
import 'package:environment_ucb/screens/information_reservation_admin_screen%20.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/aproved_request_cubit/aproved_request_cubit.dart';
import '../dto/reservation_dto.dart';
import 'information_reservation_screen.dart';

class MyPendingRequestAdminScreen extends StatelessWidget {
  const MyPendingRequestAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PendingRequestCubit>(context).getAdminPendingRequest();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

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
        text: "Administración de reservas",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: BlocBuilder<PendingRequestCubit, PendingRequestState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.requests.length,
            itemBuilder: (context, index) {
              RequestDto? request = state.requests[index];
              return MyReservationCard(
                environment: request.environment as String,
                subject: request.subject.toString(),
                parallel: request.parallel.toString(),
                date:
                    dateFormat.format(DateTime.parse(request.date.toString())),
                time: request.initTime as String,
                bottunText: "Ver detalle",
                bottunColor: Color(0xff2C3E6C),
                borderColor: Colors.black12,
                onPressed: () {
                  BlocProvider.of<RequestCubit>(context)
                      .setSelectedRequest(request);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyInformationReservationAdminScreen()));
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 0),
    );
  }
}
