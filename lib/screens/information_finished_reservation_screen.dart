import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/cubit/claim_cubit/claim_cubit.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyClaimReservationScreen extends StatefulWidget {
  const MyClaimReservationScreen({super.key});

  @override
  State<MyClaimReservationScreen> createState() =>
      _MyClaimReservationScreenState();
}

class _MyClaimReservationScreenState extends State<MyClaimReservationScreen> {
  TextEditingController reasonRequest = TextEditingController();
  bool flag = false;
  Widget build(BuildContext context) {
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
                  environment:
                      ("${state.reservation.environment} ${state.reservation.building}-${state.reservation.classroom}"),
                  borderColor: const Color.fromRGBO(211, 211, 211, 1),
                ),
                flag
                    ? CardContainer(
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
                      ))
                    : Container(),
                flag
                    ? Column(
                        children: [
                          const SizedBox(height: 10),
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
                        ],
                      )
                    : Container(),
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
                      text: flag ? "Cancelar" : "Eliminar Reserva",
                      onPressed: () {
                        if (!flag) {
                          BlocProvider.of<AprovedRequestCubit>(context)
                              .deleteReservation(
                                  state.reservation.reservationId!);
                          BlocProvider.of<AprovedRequestCubit>(context)
                              .getMyCompletedRequests();
                          Navigator.pop(context);
                        } else {
                          setState(() {
                            flag = false;
                          });
                        }
                      },
                    ),
                    MyButton(
                      fontSize: 12,
                      width: 165,
                      height: 50,
                      textColor: Colors.white,
                      color: flag
                          ? AppTheme.primary
                          : Color.fromRGBO(224, 200, 121, 1),
                      text: flag ? "Emitir" : "Registrar Reclamo",
                      onPressed: () {
                        if (flag) {
                          setState(() {
                            flag = true;
                          });
                        } else {
                          BlocProvider.of<ClaimCubit>(context).registerNewClaim(
                              state.reservation.reservationId!,
                              reasonRequest.text);
                        }
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
