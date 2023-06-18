import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_loading.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/data/Navbar/items.dart';
import 'package:environment_ucb/dto/reservation_dto.dart';
import 'package:environment_ucb/screens/information_reservation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAprovedReservation extends StatelessWidget {
  const MyAprovedReservation({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final List<BottomNavItem> _bottomNavItems =
        NavItems().bottomNavItemsProfessor;
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
                bottunColor: const Color(0xff2C3E6C),
                borderColor: Colors.black12,
                onPressed: () {
                  BlocProvider.of<AprovedRequestCubit>(context)
                      .setSelectedReservation(request);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyInformationReservationScreen()));
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

class MyAprovedReservationScreen extends StatelessWidget {
  const MyAprovedReservationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<BottomNavItem> navItems = NavItems().bottomNavItemsProfessor;
    BlocProvider.of<AprovedRequestCubit>(context).getMyAprovedRequest();
    return BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Container(
            child: state.status == PageStatus.loading
                ? myLoadingPage(
                    text: "Mis Reservas", index: 1, bottomNavItems: navItems)
                : state.status == PageStatus.success
                    ? const MyAprovedReservation()
                    : const Text("Error"),
          );
        });
  }
}
