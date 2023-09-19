import 'package:environment_ucb/components/my_error.dart';
import 'package:environment_ucb/components/my_loading.dart';
import 'package:environment_ucb/cubit/login_cubit/login_cubit.dart';
import 'package:environment_ucb/cubit/login_cubit/login_state.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/data/Navbar/items.dart';
import 'package:environment_ucb/screens/pending_request_admin_screen.dart';
import 'package:environment_ucb/screens/pending_reservations_screen.dart';
import 'package:environment_ucb/screens/registration_screen.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

// ignore: must_be_immutable
class MyLogin extends StatelessWidget {
  MyLogin({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController secret = TextEditingController();
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
          mainAxisSize: MainAxisSize.max,
          children: [
            const Image(
                width: 200,
                height: 200,
                image: AssetImage("assets/UCB_logo2.png")),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: email,
              hintText: "Correo Electrónico",
              keyboardType: TextInputType.text,
            ),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: secret,
              hintText: "Contraseña",
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            GestureDetector(
              child: const Text(
              "Registrate Aqui",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRegistrationScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: const Text(
              "¿Olvidaste tu contraseña?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              ),
              onTap: () {
                print("olvidaste tu contraseña");
              },
            ),
            SizedBox(height: 20),

            
            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: AppTheme.primary,
              text: "Ingresar",
              onPressed: () {
                //validar que los campos no esten vacios
                if (email.text.isEmpty || secret.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*Los campos no pueden estar vacios"),
                    ),
                  );
                  return;
                }
                //validar que el correo sea institucional en String[]
                bool isInst = false;
                List<String> a = email.text.split("@");
                for (int i = 0; i < a.length; i++) {
                  print(a[i]);
                  if (a[i] == "ucb.edu.bo") {
                    isInst = true;
                    break;
                  }
                }

                if (!isInst) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppTheme.alert,
                      content: Text("*El correo debe ser institucional"),
                    ),
                  );
                  return;
                }
                BlocProvider.of<LoginCubit>(context).incrementIncorrectAccess();
                BlocProvider.of<LoginCubit>(context)
                    .login(email.text, secret.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyLoginScreen extends StatelessWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {

  return BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state) {
      Widget childWidget;

      if (state.status == PageStatus.initial) {
        childWidget = MyLogin();
      } else if (state.status == PageStatus.loading) {
        if (state.isAdmin == true) {
          childWidget = myLoadingPage(
            text: "Administración de reservas",
            bottomNavItems: NavItems().bottomNavItemsAdmin,
            index: 0,
          );
        } else {
          childWidget = myLoadingPage(
            text: "Mis Reservas",
            bottomNavItems: NavItems().bottomNavItemsProfessor,
            index: 0,
          );
        }
      } else if (state.status == PageStatus.success) {
        if (state.isAdmin == true) {
          childWidget = const MyPendingRequestAdminScreen();
        } else {
          childWidget = const MyPendingRequestScreen();
        }
      } else {
        print(state.errorCount);
        if(state.errorCount == 3){
          childWidget = MyError(error: 'Usted fue bloqueado \n\n' + 'usuario y/o contraseña incorrectos', isSecure: false);
        }
        else{
          childWidget = MyLogin();
        }
        
      }

      return Container(
        child: childWidget,
      );
    },
  );
}

}
