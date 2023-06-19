import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_error.dart';
import 'package:environment_ucb/components/my_loading.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/data/Navbar/items.dart';
import 'package:environment_ucb/screens/information_finished_reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/aproved_request_cubit/aproved_request_cubit.dart';
import '../dto/reservation_dto.dart';

class MyFinishedReservation extends StatelessWidget {
  const MyFinishedReservation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BottomNavItem> _bottomNavItems =
        NavItems().bottomNavItemsProfessor;
    return Scaffold(
      appBar: const MyAppBar(
        text: "Mis Reservas",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
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
                  bottunColor: Color.fromRGBO(224, 200, 121, 1),
                  borderColor: Colors.black12,
                  onPressed: () {
                    BlocProvider.of<AprovedRequestCubit>(context)
                        .setSelectedReservation(request);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyClaimReservationScreen()));
                  },
                );
              });
        }
      }),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 3),
    );
  }
}

class MyFinishedReservationScreen extends StatelessWidget {
  const MyFinishedReservationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<BottomNavItem> navItems = NavItems().bottomNavItemsProfessor;
    print("FINISHED");

    BlocProvider.of<AprovedRequestCubit>(context).getMyCompletedRequests();
    return BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
        builder: (context, state) {
      return Container(
        child: state.status == PageStatus.loading
            ? myLoadingPage(
                text: "Mis Reservas", index: 3, bottomNavItems: navItems)
            : state.status == PageStatus.success
                ? const MyFinishedReservation()
                : MyError(error: "Error al cargar las reservas"),
      );
    });
  }
}
