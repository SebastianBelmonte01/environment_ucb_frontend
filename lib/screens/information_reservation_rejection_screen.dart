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

import '../components/my_textarea.dart';

class MyInformationRejectionScreen extends StatelessWidget {
  const MyInformationRejectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Rechazo",
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
                quantity: state.reservation.people as int,
                borderColor: const Color.fromRGBO(211, 211, 211, 1),
              ),
              CardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Motivo Rechazo:",
                      fontSize: 15,
                      color: Colors.black,
                      bold: true,
                    ),
                    MyText(
                      text: state.reservation.reasonRej as String,
                      fontSize: 15, 
                      color: Colors.black, 
                      bold: false
                    )
                  ],
              )),
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
