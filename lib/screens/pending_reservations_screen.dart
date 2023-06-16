import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/dto/request_dto.dart';
import 'package:environment_ucb/screens/request_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyPendingRequest extends StatelessWidget {
  const MyPendingRequest({super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
    DateFormat timeFormatter = DateFormat('HH:mm');

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
      body: BlocBuilder<PendingRequestCubit, PendingRequestState>(
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
                    subject: request.subject.toString(),
                    parallel: request.parallel.toString(),
                    date: dateFormatter.format(DateTime.parse(request.date!)),
                    time: request.initTime as String,
                    bottunText: "Cancelar",
                    bottunColor: Color(0xFFCB3B3B),
                    borderColor: Colors.black12,
                    onPressed: () {
                      BlocProvider.of<PendingRequestCubit>(context)
                          .cancelRequest(request.id!);
                    },
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
      //floating action button add request
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MyRequestScreen();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: AppTheme.secondary,
      ),
      bottomNavigationBar:
          myBottomNavigationBar(items: _bottomNavItems, currentIndex: 0),
    );
  }
}

class MyPendingRequestScreen extends StatelessWidget {
  const MyPendingRequestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PendingRequestCubit>(context).getMyPendingRequests();
    return BlocBuilder<PendingRequestCubit, PendingRequestState>(
      buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
      return Container(
        child: state.status == PageStatus.loading
            ? const CircularProgressIndicator()
            : state.status == PageStatus.success
                ? const MyPendingRequest()
                : const Text("Error"),
      );
    });
  }
}
