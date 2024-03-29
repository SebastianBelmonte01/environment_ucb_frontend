import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/dto/claim_dto.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MyInformationClaimPendingScreen extends StatelessWidget {
  ClaimDto claim;
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  MyInformationClaimPendingScreen({super.key, required this.claim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          text: "Detalle Solicitud",
          fontSize: 25,
          textcolor: Colors.white,
          isRegistrarion: false,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
              myInformationCard(
                subject: claim.reservationDto!.subject!,
                parallel: claim.reservationDto!.parallel!.toString(),
                date: dateFormat.format(DateTime.parse(
                    claim.reservationDto!.reservationDate.toString())),
                beginTime: claim.reservationDto!.reservationTimeInit!,
                endTime: claim.reservationDto!.reservationTimeEnd!,
                quantity: claim.reservationDto!.people!,
                environment: "${claim.reservationDto!.environment!} ${claim.reservationDto!.building!}-${claim.reservationDto!.classroom!}",
                borderColor: const Color.fromRGBO(211, 211, 211, 1),
              ),
              CardContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Reclamo:",
                    fontSize: 15,
                    color: Colors.black,
                    bold: true,
                  ),
                  MyText(
                    text:  claim.desClaim,
                    fontSize: 15,
                    color: Colors.black,
                    bold: false,
                  ),
                ],
              )),
              MyButton(
                  fontSize: 18,
                  width: 170,
                  height: 50,
                  textColor: Colors.white,
                  color: AppTheme.secondary,
                  text: "Aceptar",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ])));
  }
}
