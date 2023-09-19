import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_error.dart';
import 'package:environment_ucb/components/my_loading.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/data/Navbar/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/aproved_request_cubit/aproved_request_cubit.dart';
import '../dto/reservation_dto.dart';
import 'information_reservation_rejection_screen.dart';

class MyRejectedRequest extends StatelessWidget {
  const MyRejectedRequest({super.key});
  @override
  Widget build(BuildContext context) {
    final List<BottomNavItem> _bottomNavItems =
        NavItems().bottomNavItemsProfessor;
    return Scaffold(
      appBar: const MyAppBar(
        text: "Mis Reservas",
        fontSize: 25,
        textcolor: Colors.white,
        isRegistrarion: false,
      ),
      body: BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            if (state.reservationList.isEmpty) {
              return const Center(child: Text('No hay solicitudes'));
            } else {
              return ListView.builder(
                itemCount: state.reservationList.length,
                itemBuilder: (context, index) {
                  ReservationDto? request = state.reservationList[index];
                  return MyReservationCard(
                    environment: request.environment as String,
                    subject: request.subject.toString(),
                    parallel: request.parallel.toString(),
                    date: request.reservationDate!,
                    time: request.reservationTimeInit as String,
                    bottunText: "Ver detalle",
                    bottunColor: Color(0xFFCB3B3B),
                    borderColor: Colors.black12,
                    onPressed: () {
                      BlocProvider.of<AprovedRequestCubit>(context)
                          .setSelectedReservation(request);
                      //TODO CHANGE TO REJECTED
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyInformationRejectionScreen()));
                    },
                  );
                },
              );
            }
          }),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 2),
    );
  }
}

class MyRejectedRequestScreen extends StatelessWidget {
  const MyRejectedRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<BottomNavItem> navItems = NavItems().bottomNavItemsProfessor;
    BlocProvider.of<AprovedRequestCubit>(context).getMyRejectedReservation();
    return BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Container(
            child: state.status == PageStatus.loading
                ? myLoadingPage(
                    text: "Mis Reservas", index: 2, bottomNavItems: navItems)
                : state.status == PageStatus.success
                    ? const MyRejectedRequest()
                    : MyError(error: "Error al cargar las reservas", isSecure: true),
          );
        });
  }
}
