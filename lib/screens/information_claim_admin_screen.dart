import 'dart:convert';
import 'dart:typed_data';

import 'package:environment_ucb/components/my_SCard.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_imageDialog.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/cubit/claim_cubit/claim_cubit.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyInformationClaimAdminScreen extends StatelessWidget {
  const MyInformationClaimAdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    TextEditingController claimAnswer = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ClaimCubit, ClaimState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                myInformationCard(
                  subject:
                      state.selectedClaim!.reservationDto!.subject.toString(),
                  parallel:
                      state.selectedClaim!.reservationDto!.parallel.toString(),
                  professor: state.selectedClaim!.reservationDto!.professorName
                      .toString(),
                  date: dateFormat.format(DateTime.parse(state
                      .selectedClaim!.reservationDto!.reservationDate
                      .toString())),
                  beginTime: state
                      .selectedClaim!.reservationDto!.reservationTimeInit
                      .toString(),
                  endTime: state
                      .selectedClaim!.reservationDto!.reservationTimeEnd
                      .toString(),
                  quantity: state.selectedClaim!.reservationDto?.people as int,
                  environment:
                      ("${state.selectedClaim!.reservationDto!.environment} ${state.selectedClaim!.reservationDto!.building}-${state.selectedClaim!.reservationDto!.classroom}"),
                  borderColor: const Color.fromRGBO(211, 211, 211, 1),
                ),
                MySpecialCard(
                    borderColor: AppTheme.alert,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Motivo Reclamo:",
                          fontSize: 15,
                          color: Colors.black,
                          bold: true,
                        ),
                        MyText(
                            text: state.selectedClaim!.desClaim.toString(),
                            fontSize: 15,
                            color: Colors.black,
                            bold: false)
                      ],
                    )),
                MySpecialCard(
                    borderColor: Color(0xFFE0C879),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Respuesta:",
                          fontSize: 15,
                          color: Colors.black,
                          bold: true,
                        ),
                        MyTextArea(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.8,
                          myTextController: claimAnswer,
                          borderColor: const Color.fromRGBO(211, 211, 211, 1),
                          enable: true,
                          maxLines: 6,
                        )
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MyButton(
                  fontSize: 15,
                  width: 165,
                  height: 50,
                  textColor: Colors.white,
                  color: AppTheme.secondary,
                  text: "Ver Pruebas",
                  onPressed: () {
                    String image = state.selectedClaim!.image;
                    List<int> bytes = base64Decode(image);
                    Uint8List uint8List = Uint8List.fromList(bytes);
                    Image convertedImage = Image.memory(uint8List);
                    showDialog(
                        context: context,
                        builder: (_) => myImageDialog(image: convertedImage));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
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
                      text: "Cancelar",
                      onPressed: () {
                        Navigator.pop(context);
                        //should go to next page
                        //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                      },
                    ),
                    MyButton(
                      fontSize: 15,
                      width: 165,
                      height: 50,
                      textColor: Colors.white,
                      color: AppTheme.primary,
                      text: "Emitir",
                      onPressed: () {
                        //should go to next page
                        BlocProvider.of<ClaimCubit>(context)
                            .attendClaimAdmin(state.selectedClaim!.claimId! , claimAnswer.text);
                        Navigator.pop(context);
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
