import 'package:environment_ucb/classes/bottomNavItem_class.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_bottomNavigationBar.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/cubit/claim_cubit/claim_cubit.dart';
import 'package:environment_ucb/dto/claim_dto.dart';
import 'package:environment_ucb/screens/information_claim_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/aproved_request_cubit/aproved_request_cubit.dart';

class MyClaimedAdminReservationScreen extends StatelessWidget {
  const MyClaimedAdminReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClaimCubit>(context).getPendingClaims();
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
        text: "Mis Reservas",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: BlocBuilder<ClaimCubit, ClaimState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.claimList.length,
            itemBuilder: (BuildContext context, int index) { 
              ClaimDto claim = state.claimList[index];
              return MyReservationCard(
              environment: claim.reservationDto.environment as String,
              subject: claim.reservationDto.subject.toString(),
              parallel: claim.reservationDto.parallel.toString(),
              date: dateFormat.format(DateTime.parse(claim.reservationDto.reservationDate.toString())),
              time: claim.reservationDto.reservationTimeInit as String,
              bottunText: "Ver detalle",
              bottunColor: Color.fromRGBO(224, 200, 121, 1),
              borderColor: Colors.black12,
              onPressed: () {
                BlocProvider.of<ClaimCubit>(context).setSelectedClaim(claim);
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => MyInformationClaimScreen()));
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
