import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_environmentCard.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/cubit/aproved_request_cubit/aproved_request_cubit.dart';
import 'package:environment_ucb/screens/qr_scan_reservation_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';

class MyInformationReservationScreen extends StatelessWidget {
  Future<void> share(String textShare) async {
    await FlutterShare.share(
        title: 'Example share',
        text: textShare,
        chooserTitle: 'Example Chooser Title');
  }

  const MyInformationReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AprovedRequestCubit>(context).getMyAprovedRequest();
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<AprovedRequestCubit, AprovedRequestState>(
          builder: (context, state) {
            return Column(
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
                  boton: true,
                  onPressed: () {
                    String shareText =
                        // ignore: prefer_interpolation_to_compose_strings
                        '¡Hola! Se realizó una reserva de ambiente para: \n\n' +
                            'Asignatura: ${state.reservation.subject}\n' +
                            'Paralelo: ${state.reservation.parallel}\n' +
                            'Fecha: ${state.reservation.reservationDate}\n' +
                            'Hora de inicio: ${state.reservation.reservationTimeInit}\n' +
                            'Hora de finalización: ${state.reservation.reservationTimeEnd}\n' +
                            'Ambiente: ${state.reservation.environment} ${state.reservation.building}-${state.reservation.classroom}\n';
                    share(shareText);
                  },
                ),
                myEnvironmentCard(
                  environment: state.reservation.environment as String,
                  classroom:
                      " ${state.reservation.building} - ${state.reservation.classroom} ",
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
                        print("H)OLA");
                        BlocProvider.of<AprovedRequestCubit>(context).deleteReservation(state.reservation.reservationId!);
                        BlocProvider.of<AprovedRequestCubit>(context).getMyAprovedRequest();
                        Navigator.pop(context);
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
                        print('IDDDDDDDDD');
                        print( state.reservation.reservationId!);
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyQrScanReservationScreen(idReservation: state.reservation.reservationId!,) ));
                        //should go to next page
                        //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
