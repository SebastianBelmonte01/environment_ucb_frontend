import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/cubit/claim_cubit/claim_cubit.dart';
import 'package:environment_ucb/screens/claimed_state_reservation_screen.dart';
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
  bool flag = true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Reserva",
        fontSize: 25,
        textcolor: Colors.white,
        isRegistrarion: false,
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
                    ? Container()
                    : CardContainer(
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
                flag
                    ? Container()
                    : Column(
                        children: [
                          const SizedBox(height: 10),
                          MyButton(
                            fontSize: 15,
                            width: 170,
                            height: 50,
                            textColor: Colors.white,
                            color: AppTheme.secondary,
                            text: "Añadir Imagenes",
                            onPressed: () {
                              Navigator.pushNamed(context, '/imageClaimScreen');
                            },
                          ),
                        ],
                      ),
                const SizedBox(height: 20),
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
                      text: flag ? "Eliminar" : "Cancelar",
                      onPressed: () {
                        if (flag) {
                          setState(() {
                            BlocProvider.of<AprovedRequestCubit>(context)
                                .deleteCompletedReservation(
                                    state.reservation.reservationId!);
                            Navigator.pop(context);
                          });
                        } else {
                          setState(() {
                            flag = true;
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
                          ? Color.fromRGBO(224, 200, 121, 1)
                          : AppTheme.primary,
                      text: flag ? "Registrar Reclamo" : "Emitir",
                      onPressed: () {
                        if (flag) {
                          setState(() {
                            flag = false;
                          });
                        } else {
                          setState(() {
                            if (reasonRequest.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Por favor ingrese el motivo del reclamo'),
                                ),
                              );
                              return;
                            }
                            BlocProvider.of<ClaimCubit>(context)
                                .registerNewClaim(
                                    state.reservation.reservationId!,
                                    reasonRequest.text);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyClaimScreen()));
                          });
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
