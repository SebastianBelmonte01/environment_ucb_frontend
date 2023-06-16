import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textCart.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/screens/login_screen.dart';
import 'package:environment_ucb/screens/pending_reservations_screen.dart';
import 'package:environment_ucb/screens/request_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/request_cubit/request_cubit.dart';

class MyRequestMessageScreen extends StatelessWidget {
  const MyRequestMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: "Solicitud de Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: BlocBuilder<RequestCubit, RequestState>(
        builder: (context, state) {
          return Column(
            children: [
              MyTextCard(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  color: state.request?.state == 'En Espera'
                      ? Color(0xFF5AB674)
                      : Color(0xFFE74C3C),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                          text: "Solicitud de la reserva",
                          fontSize: 25,
                          color: Colors.white,
                          bold: true),
                      MyText(
                          text: state.request?.state == 'En Espera' ? 'Exitosa' : 'Fallida',
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
                      text: state.request?.state,
                      fontSize: 25,
                      color: Colors.black,
                      bold: true),
                  MyText(
                      text: state.request?.state == 'En Espera' ? 
                          "Su solicitud esta siendo Revisada, la respuesta sera emitida dentro de 24 hrs" 
                          : "No existen espacios disponibles para el ambiente, seleccione otra fecha u hora",
                      fontSize: 20,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                      bold: false),
                  SizedBox(height: 5),
                  MyText(
                      text: "Número de Solicitud: ${state.request?.id}",
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
                text: "Menu principal",
                onPressed: () {
                BlocProvider.of<PendingRequestCubit>(context).getMyPendingRequests();

                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              )
            ],
          );
        },
      ),
    );
  }
}


