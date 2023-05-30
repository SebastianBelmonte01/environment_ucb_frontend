import 'package:environment_ucb/components/my_SCard.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyInformationReservationAdminScreen extends StatefulWidget {
  const MyInformationReservationAdminScreen({super.key});

  @override
  State<MyInformationReservationAdminScreen> createState() =>
      _MyInformationReservationAdminScreenState();
}

class _MyInformationReservationAdminScreenState
    extends State<MyInformationReservationAdminScreen> {
  TextEditingController reasonRequest = TextEditingController();
  bool reject = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController reasonRequest = TextEditingController();

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
                  text: "Motivo:",
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
            reject // ignore: dead_code
                ? MySpecialCard(
                    borderColor: AppTheme.alert,
                    height: MediaQuery.of(context).size.height * 0.32,
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
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8,
                          myTextController: reasonRequest,
                          borderColor: const Color.fromRGBO(211, 211, 211, 1),
                          enable: true,
                        )
                      ],
                    ))
                : Container(),
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
                  text: reject ? "Cancelar" : "Rechazar Solicitud",
                  onPressed: () {
                    setState(() {
                      reject = !reject;
                    });
                  },
                ),
                MyButton(
                  fontSize: 15,
                  width: 165,
                  height: 50,
                  textColor: Colors.white,
                  color: AppTheme.primary,
                  text: reject ? "Emitir" : "Aceptar Solicitud",
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
