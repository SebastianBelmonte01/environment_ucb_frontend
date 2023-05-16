import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class MyLogin extends StatelessWidget {

  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  

  
  MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Image(
              width: 200,
              height: 200,
              image: AssetImage("assets/UCB_logo2.png")
            ),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: mail,
              hintText: "Correo Electrónico",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              myTextController: password,
              hintText: "Contraseña",
              keyboardType: TextInputType.text,
              isPassword: true,
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
              fontSize: 15, 
              width: 235, 
              height: 50, 
              textColor: Colors.white,
              color: Color(0xFF43935A),
              text: "Ingresar",
              onPressed: (){
                //should go to next page
                //BlocProvider.of<LoginCubit>(context).setAccountInfo(mail.text, password.text);
                
              },
            )
          ],
        ),
      ),
    );
  }
}
