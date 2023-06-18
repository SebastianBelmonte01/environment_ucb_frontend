import 'package:environment_ucb/components/my_SCard.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_icon_button.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

class myInformationCard extends StatelessWidget {
  String subject;
  String parallel;
  String date;
  String beginTime;
  String endTime;
  int quantity;
  String environment;
  Color borderColor;
  bool boton;
  final VoidCallback? onPressed;

  myInformationCard({
    required this.subject,
    required this.parallel,
    required this.date,
    required this.beginTime,
    required this.endTime,
    required this.quantity,
    this.environment = "",
    this.boton = false,
    this.onPressed,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    print("boton: $boton");
    return MySpecialCard(
      borderColor: borderColor,
      width: MediaQuery.of(context).size.width * 0.9,
      height: boton
          ? MediaQuery.of(context).size.height * 0.43
          : MediaQuery.of(context).size.height * 0.38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyText(
              text: "Detalle de la Reserva",
              fontSize: 25,
              color: Colors.black,
              bold: true,
              textAlign: TextAlign.center),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Row(
            children: [
              MyText(
                text: "Asignatura",
                fontSize: 15,
                color: Colors.black,
                bold: true,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Column(
                children: [
                  MyText(
                    text: subject,
                    fontSize: 15,
                    color: Colors.black,
                    bold: false,
                    textAlign: TextAlign.left,
                  ),
                  MyText(
                    text: parallel,
                    fontSize: 15,
                    color: Colors.black,
                    bold: false,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              MyText(
                text: "Fecha:",
                fontSize: 15,
                color: Colors.black,
                bold: true,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              MyText(
                text: date,
                fontSize: 15,
                color: Colors.black,
                bold: false,
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              MyText(
                text: "Hora inicio:",
                fontSize: 15,
                color: Colors.black,
                bold: true,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              MyText(
                text: beginTime,
                fontSize: 15,
                color: Colors.black,
                bold: false,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              MyText(
                text: "Hora fin:",
                fontSize: 15,
                color: Colors.black,
                bold: true,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              MyText(
                text: endTime,
                fontSize: 15,
                color: Colors.black,
                bold: false,
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              Icon(Icons.people),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              MyText(
                text: quantity.toString(),
                fontSize: 15,
                color: Colors.black,
                bold: false,
              ),
            ],
          ),
          boton
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyIconButton(
                        text: "",
                        icon: Icons.offline_share,
                        onPressed: () {
                          onPressed!();
                        }),
                  ],
                )
              : Container(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          environment != ""
              ? Row(
                  children: [
                    MyText(
                      text: "Ambiente:",
                      fontSize: 15,
                      color: Colors.black,
                      bold: true,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    MyText(
                      text: environment,
                      fontSize: 15,
                      color: Colors.black,
                      bold: false,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
