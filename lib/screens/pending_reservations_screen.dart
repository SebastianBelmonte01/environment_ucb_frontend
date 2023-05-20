import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_reservationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:flutter/material.dart';

class MyPendingRequestScreen extends StatelessWidget {
  const MyPendingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          text: "Mis Reservas",
          fontSize: 25,
          textcolor: Colors.white,
        ),
        body: Container(
            child: Column(children: [
          myReservationCard(
            environment: "Auditorio",
            subject: "Taller de Programacion",
            parallel: "paralelo 1",
            date: "12/12/2021",
            time: "12:00",
            bottunText: "Cancelar",
            bottunColor: Colors.red,
            onPressed: () {},
          )
        ])));
  }
}
