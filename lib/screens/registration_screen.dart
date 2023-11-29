import 'package:environment_ucb/components/my_SCard.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/cubit/registration_cubit/registration_cubit.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:environment_ucb/utils/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRegistrationScreen extends StatelessWidget {
  MyRegistrationScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController secret = TextEditingController();
  TextEditingController secretConfirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      appBar: 
        const MyAppBar(
          text: "",
          fontSize: 25,
          textcolor: Colors.white,
          isRegistrarion: true,
        ),
      body: CardContainer(
        child: Column(
          children: [
            MyText(
              text: "Formulario de Registro", 
              fontSize: 25, 
              color: Colors.black, 
              bold: true
            ),
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
            const SizedBox(height: 20),
            MyText(
              text: "Confirme su contraseña:", 
              fontSize: 18, 
              color: Colors.black, 
              bold: false
            ),
            const SizedBox(height: 20),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: secretConfirmation,
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
              text: "Registrarse",
              onPressed: () {
                if(secret.text != secretConfirmation.text){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*Las contraseñas no coinciden"),
                    ),
                  );
                }
                else
                if(!auth.isPasswordSecure(secret.text)){
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*La contraseña debe tener al menos 8 caracteres, una letra mayúscula, un número y un carácter especial"),
                    ),
                  );
                }
                if(!auth.isUcbEmail(email.text)){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*El correo debe ser institucional"),
                    ),
                  );
                }
                if (auth.isPasswordSecure(secret.text) && auth.isUcbEmail(email.text) && secret.text == secretConfirmation.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.primary,
                      content: Text("*Usuario registrado correctamente"),
                    ),
                  );

                }

                
                BlocProvider.of<RegistrationCubit>(context).createAccount(email.text, secret.text);
                Navigator.pop(context);

                
                
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


