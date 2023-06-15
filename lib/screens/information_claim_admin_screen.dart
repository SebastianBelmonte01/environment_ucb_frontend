import 'package:environment_ucb/components/my_SCard.dart';
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

class MyInformationClaimScreen extends StatelessWidget {
  const MyInformationClaimScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController reasonClaim = TextEditingController();
    TextEditingController claimAnswer = TextEditingController();
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
            MySpecialCard(
                borderColor: AppTheme.alert,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Motivo Rechazo:",
                      fontSize: 15,
                      color: Colors.black,
                      bold: true,
                    ),
                    MyTextArea(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      myTextController: reasonClaim,
                      borderColor: const Color.fromRGBO(211, 211, 211, 1),
                      enable: false,
                      maxLines: 5,
                    )
                  ],
                )),
            MyButton(
              fontSize: 15,
              width: 170,
              height: 50,
              textColor: Colors.white,
              color: AppTheme.secondary,
              text: "Ver Prueba",
              onPressed: () {
                Navigator.pushNamed(context, '/imageClaimScreen');
              },
            ),
            MySpecialCard(
                borderColor: Color(0xFFE0C879),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Respuesta:",
                      fontSize: 15,
                      color: Colors.black,
                      bold: true,
                    ),
                    MyTextArea(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      myTextController: reasonClaim,
                      borderColor: const Color.fromRGBO(211, 211, 211, 1),
                      enable: true,
                      maxLines: 5,
                    )
                  ],
                )),
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
                  text: "Cancelar",
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
                  color: AppTheme.primary,
                  text: "Emitir",
                  onPressed: () {
                    //should go to next page
                    //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            MyButton(
              fontSize: 15,
              width: 165,
              height: 50,
              textColor: Colors.white,
              color: Color(0xFFE0C879),
              text: "Strike",
              onPressed: () {
                //should go to next page
                //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
