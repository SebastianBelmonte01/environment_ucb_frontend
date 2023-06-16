import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                myInformationCard(
                subject: state.reservation.subject as String,
                parallel: state.reservation.parallel.toString(),
                date: state.reservation.reservationDate!,
                beginTime: state.reservation.reservationTimeInit as String,
                endTime: state.reservation.reservationTimeEnd as String,
                quantity: state.reservation.people as int,
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MyButton(
                      fontSize: 12,
                      width: 170,
                      height: 50,
                      textColor: Colors.white,
                      color: AppTheme.alert,
                      text: "Eliminar Reserva",
                      onPressed: () {
                        BlocProvider.of<AprovedRequestCubit>(context).deleteReservation(state.reservation.reservationId!);
                        BlocProvider.of<AprovedRequestCubit>(context).getMyCompletedRequests();
                        Navigator.pop(context);
                      },
                    ),
                    MyButton(
                      fontSize: 12,
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
          );
        },
      ),
    );
  }
}
