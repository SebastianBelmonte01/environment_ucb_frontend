import 'package:environment_ucb/components/my_button.dart';
import 'package:flutter/material.dart';

import 'my_card.dart';
import 'my_text.dart';

class myInformationCard extends StatelessWidget {
  String subject;
  String parallel;
  String date;
  String beginTime;
  String endTime;
  int quantity;

  myInformationCard({
    super.key,
    required this.subject,
    required this.parallel,
    required this.date,
    required this.beginTime,
    required this.endTime,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
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
            mainAxisAlignment: MainAxisAlignment.start,
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
          )
        ],
      ),
    );
  }
}
