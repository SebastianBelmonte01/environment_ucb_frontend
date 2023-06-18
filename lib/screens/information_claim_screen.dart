import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyInformationClaimScreen extends StatelessWidget {
  const MyInformationClaimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          text: "Detalle Solicitud",
          fontSize: 25,
          textcolor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
              myInformationCard(
                subject: "Ingenieria de Software 1",
                parallel: "1",
                date: "12/12/2021",
                beginTime: "12:00",
                endTime: "14:00",
                quantity: 20,
                environment: "Aula 1",
                borderColor: const Color.fromRGBO(211, 211, 211, 1),
              ),
              CardContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Reclamo:",
                    fontSize: 15,
                    color: Colors.black,
                    bold: true,
                  ),
                  MyText(
                    text: "El ambiente no se encontraba en buenas condiciones",
                    fontSize: 15,
                    color: Colors.black,
                    bold: false,
                  ),
                ],
              )),
              CardContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Respuesta:",
                    fontSize: 15,
                    color: Colors.black,
                    bold: true,
                  ),
                  MyText(
                    text: "Se le dara una sancion al encargado del ambiente",
                    fontSize: 15,
                    color: Colors.black,
                    bold: false,
                  ),
                ],
              )),
              MyButton(
                  fontSize: 18,
                  width: 170,
                  height: 50,
                  textColor: Colors.white,
                  color: AppTheme.secondary,
                  text: "Aceptar",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ])));
  }
}
