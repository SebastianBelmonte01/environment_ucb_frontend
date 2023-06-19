import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/screens/login_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';

class MyError extends StatelessWidget {
  String error;
  MyError({this.error = "", super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyText(
                text: error == "" ? "Ha ocurrido un Error inesperado" : error,
                fontSize: 20,
                color: Colors.white,
                bold: true),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: AppTheme.primary,
              text: "Reintentar",
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyLogin()));
              },
            )
          ],
        ),
      ),
    );
  }
}
