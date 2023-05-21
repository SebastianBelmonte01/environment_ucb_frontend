import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_textCart.dart';
import 'package:flutter/material.dart';

import 'my_card.dart';
import 'my_text.dart';

class myEnvironmentCard extends StatelessWidget {
  String environment;
  String classroom;

  myEnvironmentCard({
    super.key,
    required this.environment,
    required this.classroom,
  });

  @override
  Widget build(BuildContext context) {
    return myTextCard(
      borderColor: Colors.black,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
              text: "Ambiente Asignado",
              fontSize: 25,
              color: Colors.black,
              bold: true,
              textAlign: TextAlign.center),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          MyText(
              text: environment, fontSize: 20, color: Colors.black, bold: true),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          MyText(
              text: classroom, fontSize: 23, color: Colors.black, bold: true),
        ],
      ),
    );
  }
}
