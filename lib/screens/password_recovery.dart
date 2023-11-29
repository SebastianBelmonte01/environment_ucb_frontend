import 'dart:math';

import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/services/password_service.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:environment_ucb/utils/Auth.dart';
import 'package:flutter/material.dart';

class MyPasswordRecovery extends StatelessWidget {
  MyPasswordRecovery({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController secret = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      appBar: 
        const MyAppBar(
          text: "Me olividé mi contraseña",
          fontSize: 25,
          textcolor: Colors.white,
          isRegistrarion: true,
        ),
      body: CardContainer(
        child: Column(
          children: [
            const SizedBox(height: 40),
            MyText(
              text: "Ingrese su correo institucional:", 
              fontSize: 18, 
              color: Colors.black, 
              bold: false
            ),
            const SizedBox(height: 20),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: email,
              hintText: "Correo Electrónico",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: AppTheme.secondary,
              text: "Enviar Correo",
              onPressed: () {
                if(email.text == ""){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*Ingrese el correo"),
                    ),
                  );
                }
                else if(!auth.isUcbEmail(email.text)){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*El correo debe ser institucional"),
                    ),
                  );
                }
                else{
                  PasswordService.password(email.text).then((result) {
                    if (result == "OK") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppTheme.primary,
                          content: Text("*Correo enviado"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red, // Change color to indicate failure
                          content: Text("Failed to send email"),
                        ),
                      );
                    }
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Error occurred"),
                      ),
                    );
                  });
                }
              }
            ),
            const SizedBox(height: 20),
            MyText(
              text: "Ingrese el codigo:", 
              fontSize: 18, 
              color: Colors.black, 
              bold: false
            ),
            const SizedBox(height: 20),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: code,
              hintText: "Codigo",
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            MyText(
              text: "Ingrese su contraseña:", 
              fontSize: 18, 
              color: Colors.black, 
              bold: false
            ),
            const SizedBox(height: 20),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: secret,
              hintText: "Contraseña",
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: AppTheme.primary,
              text: "Cambiar Contraseña",
              onPressed: () {
                if(code.text == ""){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*Ingrese el código"),
                    ),
                  );
                }
                if(!auth.isPasswordSecure(secret.text)){
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*La contraseña debe tener al menos 8 caracteres, una letra mayúscula, un número y un carácter especial"),
                    ),
                  );
                }
                else{
                  PasswordService.changePassword(email.text, code.text, secret.text).then((result) {
                    if (result == "OK") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppTheme.primary,
                          content: Text("*Contraseña cambiada"),
                        ),
                      );
                      }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red, // Change color to indicate failure
                          content: Text("Failed to verify code"),
                        ),
                      );
                    }
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Error occurred"),
                      ),
                    );
                  });
                }
              }
            ),
            SizedBox(height: 20),
            MyButton(
              fontSize: 15,
              width: 235, 
              height: 50,
              color: AppTheme.alert, 
              textColor: Colors.white,
              text: "Cancelar",
              onPressed: () {
                Navigator.pop(context);
              }
            ),

          ],
        ),
      ),
    );
  }
}