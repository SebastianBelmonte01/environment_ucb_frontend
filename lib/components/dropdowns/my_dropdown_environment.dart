import 'package:environment_ucb/cubit/environment_cubit/environment_cubit.dart';
import 'package:environment_ucb/cubit/professor_cubit/professor_cubit.dart';
import 'package:environment_ucb/dto/environment_dto.dart';
import 'package:environment_ucb/dto/subject_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDropDownEnvironment extends StatefulWidget {
  const MyDropDownEnvironment({super.key});

  @override
  State<MyDropDownEnvironment> createState() => _MyDropDownEnvironmentState();
}

class _MyDropDownEnvironmentState extends State<MyDropDownEnvironment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvironmentCubit, EnvironmentState>(
      builder: (context, state){
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: 
            DropdownButton(
              isExpanded: true,
              value: state.environments[state.selectedEnvironmentIndex].type,
              items: state.environments.map<DropdownMenuItem<String>>((EnvironmentDto value) {
                return DropdownMenuItem<String>(
                  value: value.type,
                  child: Text(value.type!),
                );
              }).toList(),
              onChanged: (String? selectedLabel) {
                BlocProvider.of<EnvironmentCubit>(context).changeSelectedEnvironment(selectedLabel!);
              }
            )
        );
      },
    );
  }
}