import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_environmentCard.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textCart.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyClaimReservationScreen extends StatelessWidget {
  const MyClaimReservationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController reasonRequest = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: SingleChildScrollView(
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
            CardContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Motivo del reclamo:",
                  fontSize: 15,
                  color: Colors.black,
                  bold: true,
                ),
                MyTextArea(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  myTextController: reasonRequest,
                  borderColor: const Color.fromRGBO(211, 211, 211, 1),
                  enable: true,
                )
              ],
            )),
            MyButton(
              fontSize: 15,
              width: 170,
              height: 50,
              textColor: Colors.white,
              color: AppTheme.alert,
              text: "Añadir Imagenes",
              onPressed: () {
                Navigator.pushNamed(context, '/imageClaimScreen');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                MyButton(
                  fontSize: 15,
                  width: 170,
                  height: 50,
                  textColor: Colors.white,
                  color: AppTheme.alert,
                  text: "Eliminar Reserva",
                  onPressed: () {
                    //should go to next page
                    //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                  },
                ),
                MyButton(
                  fontSize: 15,
                  width: 165,
                  height: 50,
                  textColor: Colors.white,
                  color: Color.fromRGBO(224, 200, 121, 1),
                  text: "Registrar Reclamo",
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
