import 'package:clipboard/clipboard.dart';
import 'package:environment_ucb/components/my_SCard.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_imageDialog.dart';
import 'package:environment_ucb/components/my_informationCard.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class MyStrikeAdminScreen extends StatelessWidget {
  const MyStrikeAdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController reasonClaim = TextEditingController();
    TextEditingController reasonStrike = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(
        text: "Detalle Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            myInformationCard(
                subject: "Arquitectura del Software",
                parallel: "Paralelo 1",
                date: "12/12/2021",
                beginTime: "12:00",
                endTime: "14:00",
                quantity: 45,
                borderColor: const Color.fromRGBO(211, 211, 211, 1)),
            MySpecialCard(
                borderColor: AppTheme.alert,
                height: MediaQuery.of(context).size.height * 0.22,
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
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      myTextController: reasonClaim,
                      borderColor: const Color.fromRGBO(211, 211, 211, 1),
                      enable: false,
                      maxLines: 5,
                    )
                  ],
                )),
            MySpecialCard(
                borderColor: Color(0xFFE0C879),
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Motivo Strike:",
                      fontSize: 15,
                      color: Colors.black,
                      bold: true,
                    ),
                    MyTextArea(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      myTextController: reasonStrike,
                      borderColor: const Color.fromRGBO(211, 211, 211, 1),
                      enable: true,
                      maxLines: 5,
                    )
                  ],
                )),
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
                    Image src = Image.asset("assets/UCB_logo2.png");
                    showDialog(
                        context: context,
                        builder: (_) => myImageDialog(image: src));
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
                    //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
