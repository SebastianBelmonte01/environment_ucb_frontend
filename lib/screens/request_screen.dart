import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/my_icon_button.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:flutter/material.dart';

class MyRequestScreen extends StatelessWidget {
  const MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cantidad_personas = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: MyText(
            text: "Solicitud de Reserva", fontSize: 25, color: Colors.white),
        flexibleSpace: const Image(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            CardContainer(
                child: Column(
              children: [
                Row(
                  children: [
                    MyText(text: "Fecha", fontSize: 15, color: Colors.black),
                  ],
                ),
                Row(
                  children: [
                    MyText(
                        text: "Hora Inicio", fontSize: 15, color: Colors.black),
                  ],
                ),
                Row(
                  children: [
                    MyText(text: "Hora Fin", fontSize: 15, color: Colors.black),
                  ],
                )
              ],
            )),
            CardContainer(
                child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText(text: "Ambiente", fontSize: 15, color: Colors.black),
                    //Dropdownbutton con tres items: Auditorio, Aula, Laboratorio
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text("Auditorio"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Aula"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("Laboratorio"),
                          value: 3,
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText(
                        text: "Asignatura", fontSize: 15, color: Colors.black),
                    //Dropdownbutton con items: Introduccion, Programacion 1, Programacion 2
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text("Introduccion"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Programacion 1"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("Programacion 2"),
                          value: 3,
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyText(
                        text: "Cantidad de Personas",
                        fontSize: 15,
                        color: Colors.black),
                    //Textfield de cantidad de personas
                    MyTextField(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.2,
                      myTextController: cantidad_personas,
                      hintText: "1",
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ],
            )),
            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: Color(0xFF43935A),
              text: "Siguiente",
              onPressed: () {
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
