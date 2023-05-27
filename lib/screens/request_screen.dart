import 'package:environment_ucb/components/dropdowns/my_dropdown_environment.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/dropdowns/my_dropdown_subjects.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textCart.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/cubit/professor_cubit/professor_cubit.dart';
import 'package:environment_ucb/screens/request_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/dropdowns/my_dropdown_parallels.dart';
import '../cubit/page_status.dart';

class MyRequest extends StatelessWidget {
  const MyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cantidad_personas = TextEditingController();
    TextEditingController reasonRequest = TextEditingController();

    return Scaffold(
      appBar: const MyAppBar(
        text: "Solicitud de Reserva",
        fontSize: 25,
        textcolor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            CardContainer(
                child: Column(
                children: [
                  Row(
                    children: [
                      MyText(
                        text: "Fecha:",
                        fontSize: 15,
                        color: Colors.black,
                        bold: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                        text: "Hora inicio:",
                        fontSize: 15,
                        color: Colors.black,
                        bold: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyText(
                        text: "Hora fin:",
                        fontSize: 15,
                        color: Colors.black,
                        bold: true,
                      ),
                    ],
                  )
                ],
              )),
              CardContainer(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyText(
                        text: "Ambiente",
                        fontSize: 15,
                        color: Colors.black,
                        bold: true,
                      ),
                      //Dropdownbutton con tres items: Auditorio, Aula, Laboratorio
                      const MyDropDownEnvironment()
                      
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyText(
                        text: "Asignatura",
                        fontSize: 15,
                        color: Colors.black,
                        bold: true,
                      ),
                     //Dropdownbutton con items: Introduccion, Programacion 1, Programacion 2
                    const MyDropDownSubject(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyText(
                        text: "Paralelo:",
                        fontSize: 15,
                        color: Colors.black,
                        bold: true,
                      ),
                      //Dropdownbutton con items: Introduccion, Programacion 1, Programacion 2
                      const MyDropDownParallel()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyText(
                        text: "Cantidad de Personas",
                        fontSize: 15,
                        color: Colors.black,
                        bold: true,
                      ),
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
              )
            ),
            CardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Motivo:", 
                    fontSize: 15,
                    color: Colors.black,
                    bold: true,
                  ),
                  MyTextArea(
                    height: MediaQuery.of(context).size.height * 0.2, 
                    width: MediaQuery.of(context).size.width * 0.8, 
                    myTextController: reasonRequest, 
                    borderColor: const Color.fromRGBO(211,211,211, 1),
                  )
                  
                ],
              )
            
            ),

            MyButton(
              fontSize: 15,
              width: 235,
              height: 50,
              textColor: Colors.white,
              color: Color(0xFF43935A),
              text: "Siguiente",
              onPressed: () {
                Navigator.pushNamed(context, '/requestMessageScreen');
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
class MyRequestScreen extends StatelessWidget {
  const MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessorCubit, ProfessorCubitState>(
      builder: (context, state) {
        return Container(
          child: state.status == PageStatus.loading
                    ? const CircularProgressIndicator()
                    : state.status == PageStatus.success
                        ? const MyRequest() 
                        : const Text("Error"),
            );
          }
        );
  }
}