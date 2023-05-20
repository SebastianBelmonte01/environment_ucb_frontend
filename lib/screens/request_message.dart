import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textCart.dart';
import 'package:flutter/material.dart';

class MyRequestMessageScreen extends StatelessWidget {
  const MyRequestMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int nSolicitud = 12;
    return Scaffold(
      appBar: const MyAppBar(
        text: "Solicitud de Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            myTextCard(
                alert: false,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                        text: "Solicitud de la Reserva",
                        fontSize: 25,
                        color: Colors.white,
                        bold: true),
                    MyText(
                        text: "Aceptado",
                        fontSize: 25,
                        color: Colors.white,
                        bold: true),
                  ],
                )),
            CardContainer(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                    text: "Estado de la Solicitud:",
                    fontSize: 25,
                    color: Colors.black,
                    bold: true),
                MyText(
                    text: "En Revision",
                    fontSize: 25,
                    color: Colors.black,
                    bold: true),
                SizedBox(height: 5),
                MyText(
                    text:
                        "Su Solicitud esta siendo Revisada, la respuesta sera emitida dentro de 24 hrs",
                    fontSize: 20,
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    bold: false),
                SizedBox(height: 5),
                MyText(
                    text: "Número de Solicitud: ${nSolicitud}",
                    fontSize: 18,
                    color: Colors.black,
                    bold: true)
              ]
                  .map((widget) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget,
                      ))
                  .toList(),
            )),
            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: Color(0xFF43935A),
              text: "Ver reservas",
              onPressed: () {
                Navigator.pushNamed(context, '/pendingScreen');
                //should go to next page
                //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
              },
            ),
            //space between buttons
            SizedBox(
              height: 20,
            ),
            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: Color(0xFF43935A),
              text: "Salir",
              onPressed: () {
                //should go to next page
                //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
