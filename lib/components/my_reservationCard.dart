import 'package:environment_ucb/components/my_button.dart';
import 'package:flutter/material.dart';

import 'my_card.dart';
import 'my_text.dart';

class myReservationCard extends StatelessWidget {
  String environment;
  String subject;
  String parallel;
  String date;
  String time;
  String bottunText;
  Color bottunColor;
  Function onPressed;

  myReservationCard({
    super.key,
    required this.environment,
    required this.subject,
    required this.parallel,
    required this.date,
    required this.time,
    required this.bottunText,
    required this.bottunColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
              text: environment,
              fontSize: 25,
              color: Colors.black,
              bold: true,
              textAlign: TextAlign.center),
          SizedBox(height: 10),
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
          SizedBox(height: 10),
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
          SizedBox(height: 10),
          Row(
            children: [
              MyText(
                text: "Hora:",
                fontSize: 15,
                color: Colors.black,
                bold: true,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              MyText(
                text: time,
                fontSize: 15,
                color: Colors.black,
                bold: false,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.3),
              MyButton(
                text: bottunText,
                fontSize: 15,
                color: bottunColor,
                width: 102.77,
                height: 45,
                textColor: Colors.white,
                onPressed: onPressed,
              )
            ],
          )
        ],
      ),
    );
  }
}