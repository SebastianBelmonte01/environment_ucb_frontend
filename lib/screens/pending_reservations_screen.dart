import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/dto/request_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPendingRequestScreen extends StatelessWidget {
  const MyPendingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requestCubit = PendingRequestCubit()..getRequests();
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
        BlocBuilder<PendingRequestCubit, PendingRequestState>(
          builder: (context, state) {
            if (state.status == PageStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == PageStatus.success) {
              if (state.requests.isEmpty) {
                return const Center(child: Text('No hay solicitudes'));
              } else {
                return ListView.builder(
                  itemCount: state.requests.length,
                  itemBuilder: (context, index) {
                    RequestDto request = state.requests[index];
                    return MyReservationCard(
                      environment: request.environment as String,
                      subject: request.subject as String,
                      parallel: request.parallel as String,
                      date: request.date as String,
                      time: request.initTime as String,
                      bottunText: "Cancelar",
                      bottunColor: Colors.red,
                      borderColor: Colors.black12,
                      onPressed: () {},
                    );
                  },
                );
              }
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ])),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 0),
    );
  }
}
