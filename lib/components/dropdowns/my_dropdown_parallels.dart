import 'package:environment_ucb/cubit/professor_cubit/professor_cubit.dart';
import 'package:environment_ucb/dto/subject_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDropDownParallel extends StatefulWidget {
  const MyDropDownParallel({super.key});

  @override
  State<MyDropDownParallel> createState() => _MyDropDownParallelState();
}

class _MyDropDownParallelState extends State<MyDropDownParallel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessorCubit, ProfessorCubitState>(
      builder: (context, state){
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: 
            DropdownButton(
              //Make the size of the dropdown button the same as the textfiel
              isExpanded: true,
              value: state.professorDto.subjects?[state.selectedSubjectIndex].parallels?[state.selectedParallelIndex].toString(),
              items: state.professorDto.subjects?[state.selectedSubjectIndex].parallels?.map<DropdownMenuItem<String>>((int value) {
                return DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (String? selectedLabel) {
                BlocProvider.of<ProfessorCubit>(context).changeSelectedParallel(selectedLabel!);
              }
            )
        );
      },
    );
  }
}