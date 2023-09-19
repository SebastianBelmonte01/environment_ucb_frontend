import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_error.dart';
import 'package:environment_ucb/components/my_loading.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/cubit/request_cubit/request_cubit.dart';
import 'package:environment_ucb/data/Navbar/items.dart';
import 'package:environment_ucb/dto/request_dto.dart';
import 'package:environment_ucb/screens/information_reservation_admin_screen%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyPendingRequestAdmin extends StatelessWidget {
  const MyPendingRequestAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    final List<BottomNavItem> _bottomNavItems = NavItems().bottomNavItemsAdmin;
    return Scaffold(
      appBar: const MyAppBar(
        text: "Administración de reservas",
        fontSize: 20,
        textcolor: Colors.white,
        isRegistrarion: false,
      ),
      body: BlocBuilder<PendingRequestCubit, PendingRequestState>(
          builder: (context, state) {
        if (state.requests.isEmpty) {
          return const Center(child: Text('No hay solicitudes'));
        } else {
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
        }
      }),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 0),
    );
  }
}

class MyPendingRequestAdminScreen extends StatelessWidget {
  const MyPendingRequestAdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<BottomNavItem> navItems = NavItems().bottomNavItemsAdmin;
    BlocProvider.of<PendingRequestCubit>(context).getAdminPendingRequest();
    return BlocBuilder<PendingRequestCubit, PendingRequestState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Container(
            child: state.status == PageStatus.loading
                ? myLoadingPage(
                    text: "Administración de reservas",
                    index: 0,
                    bottomNavItems: navItems)
                : state.status == PageStatus.success
                    ? const MyPendingRequestAdmin()
                    : MyError(error: "Error al cargar las Solicitudes", isSecure: true),
          );
        });
  }
}
