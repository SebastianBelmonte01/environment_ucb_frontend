import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_environmentCard.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyInformationReservationScreen extends StatelessWidget {
  const MyInformationReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cantidad_personas = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            myInformationCard(
              subject: "Arquitectura del Software",
              parallel: "Paralelo 1",
              date: "12/12/2021",
              beginTime: "12:00",
              endTime: "14:00",
              quantity: 45,
              borderColor: const Color.fromRGBO(211, 211, 211, 1),
            ),
            myEnvironmentCard(
              environment: "Laboratorio",
              classroom: "C 103",
              borderColor: const Color.fromRGBO(211, 211, 211, 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                MyButton(
                  fontSize: 15,
                  width: 121.39,
                  height: 50,
                  textColor: Colors.white,
                  color: AppTheme.alert,
                  text: "Cancelar",
                  onPressed: () {
                    //should go to next page
                    //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                  },
                ),
                MyButton(
                  fontSize: 15,
                  width: 121.39,
                  height: 50,
                  textColor: Colors.white,
                  color: AppTheme.primary,
                  text: "Registrar",
                  onPressed: () {
                    //should go to next page
                    //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
