import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_environmentCard.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyInformationReservationScreen extends StatelessWidget {
  const MyInformationReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              myInformationCard(
                subject: state.reservation.subject as String,
                parallel: state.reservation.parallel.toString(),
                date:  state.reservation.reservationDate!,
                beginTime: state.reservation.reservationTimeInit as String,
                endTime: state.reservation.reservationTimeEnd as String,
                quantity: 45,
                borderColor: const Color.fromRGBO(211, 211, 211, 1),
              ),
              myEnvironmentCard(
                environment: state.reservation.environment as String,
                classroom: " ${state.reservation.building} - ${state.reservation.classroom} ",
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
          );
        },
      ),
    );
  }
}
