import 'package:environment_ucb/components/dropdowns/my_dropdown_environment.dart';
import 'package:environment_ucb/components/my_appBar.dart';
import 'package:environment_ucb/components/my_button.dart';
import 'package:environment_ucb/components/my_calendar.dart';
import 'package:environment_ucb/components/my_card.dart';
import 'package:environment_ucb/components/dropdowns/my_dropdown_subjects.dart';
import 'package:environment_ucb/components/my_error.dart';
import 'package:environment_ucb/components/my_requestShimmer.dart';
import 'package:environment_ucb/components/my_text.dart';
import 'package:environment_ucb/components/my_textarea.dart';
import 'package:environment_ucb/components/my_textfield.dart';
import 'package:environment_ucb/components/timepickers/end_time.dart';
import 'package:environment_ucb/components/timepickers/init_timepicker.dart';
import 'package:environment_ucb/cubit/environment_cubit/environment_cubit.dart';
import 'package:environment_ucb/cubit/pending_request_cubit/pending_request_cubit.dart';
import 'package:environment_ucb/cubit/professor_cubit/professor_cubit.dart';
import 'package:environment_ucb/cubit/request_cubit/request_cubit.dart';
import 'package:environment_ucb/screens/request_message.dart';
import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../components/dropdowns/my_dropdown_parallels.dart';
import '../cubit/page_status.dart';

// ignore: must_be_immutable
class MyRequest extends StatelessWidget {
  TextEditingController cantidad_personas = TextEditingController();
  TextEditingController reasonRequest = TextEditingController();
  MyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    DateFormat timeFormat = DateFormat('HH:mm');
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    return Scaffold(
      appBar: const MyAppBar(
        text: "Solicitud de Reserva",
        fontSize: 20,
        textcolor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CardContainer(child: BlocBuilder<RequestCubit, RequestState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyText(
                            text:
                                "Fecha: ${state.date == null ? "" : '${dateFormat.format(state.date!)}'}",
                            fontSize: 15,
                            color: Colors.black,
                            bold: true,
                          ),
                          DatePicker(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyText(
                            text:
                                "Hora inicio: ${state.initTime == null ? "" : timeFormat.format(state.initTime!)}",
                            fontSize: 15,
                            color: Colors.black,
                            bold: true,
                          ),
                          MyInitTimePicker()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyText(
                            text:
                                "Hora fin: ${state.endTime == null ? "" : timeFormat.format(state.endTime!)}",
                            fontSize: 15,
                            color: Colors.black,
                            bold: true,
                          ),
                          MyEndTimePicker()
                        ],
                      )
                    ],
                  );
                },
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
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.2,
                        myTextController: cantidad_personas,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ],
              )),
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
                    borderColor: const Color.fromRGBO(211, 211, 211, 1),
                    enable: true,
                  )
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                    fontSize: 15,
                    width: 150,
                    height: 50,
                    textColor: Colors.white,
                    color: AppTheme.alert,
                    text: "Cancelar",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  MyButton(
                    fontSize: 15,
                    width: 150,
                    height: 50,
                    textColor: Colors.white,
                    color: Color(0xFF43935A),
                    text: "Siguiente",
                    onPressed: () {
                      String environment =
                          BlocProvider.of<EnvironmentCubit>(context)
                              .state
                              .environments[
                                  BlocProvider.of<EnvironmentCubit>(context)
                                      .state
                                      .selectedEnvironmentIndex]
                              .type!;
                      String subject = BlocProvider.of<ProfessorCubit>(context)
                          .state
                          .professorDto
                          .subjects![BlocProvider.of<ProfessorCubit>(context)
                              .state
                              .selectedSubjectIndex]
                          .name!;
                      int parallel = BlocProvider.of<ProfessorCubit>(context)
                              .state
                              .professorDto
                              .subjects![
                                  BlocProvider.of<ProfessorCubit>(context)
                                      .state
                                      .selectedSubjectIndex]
                              .parallels![
                          BlocProvider.of<ProfessorCubit>(context)
                              .state
                              .selectedParallelIndex];
                      int people = int.parse(cantidad_personas.text);
                      String reason = reasonRequest.text;
                      BlocProvider.of<RequestCubit>(context).postRequest(
                          environment, subject, parallel, people, reason);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyRequestMessageScreen()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyRequestScreen extends StatelessWidget {
  const MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PendingRequestCubit>(context).getMyPendingRequests();
    return BlocBuilder<ProfessorCubit, ProfessorCubitState>(
        builder: (context, state) {
      return Container(
        child: state.status == PageStatus.loading
            ? MyShimmerRequest()
            : state.status == PageStatus.success
                ? MyRequest()
                : MyError(error: "Error al cargar el formulario"),
      );
    });
  }
}
