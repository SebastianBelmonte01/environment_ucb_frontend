import 'package:environment_ucb/components/my_SCard.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/cubit/request_cubit/request_cubit.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyInformationReservationAdminScreen extends StatefulWidget {
  const MyInformationReservationAdminScreen({super.key});

  @override
  State<MyInformationReservationAdminScreen> createState() =>
      _MyInformationReservationAdminScreenState();
}

class _MyInformationReservationAdminScreenState
    extends State<MyInformationReservationAdminScreen> {
  TextEditingController reasonRequest = TextEditingController();
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

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
        child: BlocBuilder<RequestCubit, RequestState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                myInformationCard(
                  subject: state.request!.subject as String,
                  parallel: state.request!.parallel.toString(),
                  professor: state.request!.professroName as String,
                  date: dateFormat
                      .format(DateTime.parse(state.request!.date.toString())),
                  beginTime: state.request!.initTime.toString(),
                  endTime: state.request!.endTime.toString(),
                  quantity: state.request!.people as int,
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
                    MyText(
                      text: state.request!.reason as String,
                      fontSize: 15,
                      color: Colors.black,
                      bold: false,
                    ),
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
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.8,
                              myTextController: reasonRequest,
                              borderColor:
                                  const Color.fromRGBO(211, 211, 211, 1),
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
                      fontSize: 12,
                      width: 170,
                      height: 50,
                      textColor: Colors.white,
                      color: AppTheme.alert,
                      text: reject ? "Cancelar" : "Rechazar solicitud",
                      onPressed: () {
                        setState(() {
                          reject = !reject;
                        });
                      },
                    ),
                    MyButton(
                      fontSize: 12,
                      width: 165,
                      height: 50,
                      textColor: Colors.white,
                      color: AppTheme.primary,
                      text: reject ? "Emitir" : "Aceptar solicitud",
                      onPressed: () {
                        if (!reject) {
                          //Accepted Request
                          BlocProvider.of<PendingRequestCubit>(context)
                              .aproveRequest(state.request?.id as int);
                          Navigator.pop(context);
                        } else {
                          //Reject Request
                          if (reasonRequest.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: AppTheme.alert,
                                content: Text("Llene todos los campos"),
                              ),
                            );
                            return;
                          }
                          BlocProvider.of<PendingRequestCubit>(context)
                              .rejectRequest(
                                  state.request?.id as int, reasonRequest.text);
                          Navigator.pop(context);
                        }
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
      ),
    );
  }
}
