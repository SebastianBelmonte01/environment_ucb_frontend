import 'package:environment_ucb/cubit/professor_cubit/professor_cubit.dart';
import 'package:environment_ucb/dto/subject_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDropDownSubject extends StatefulWidget {
  

  const MyDropDownSubject({super.key});

  @override
  State<MyDropDownSubject> createState() => _MyDropDownSubjectState();
}

class _MyDropDownSubjectState extends State<MyDropDownSubject> {
  
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
              value: state.professorDto.subjects?[state.selectedSubjectIndex].name,
              items: state.professorDto.subjects?.map<DropdownMenuItem<String>>((SubjectDto value) {
                return DropdownMenuItem<String>(
                  value: value.name,
                  child: Text(value.name!),
                );
              }).toList(),
              onChanged: (String? selectedLabel) {
                BlocProvider.of<ProfessorCubit>(context).changeSelectedParallelToInitial();
                BlocProvider.of<ProfessorCubit>(context).changeSelectedSubject(selectedLabel!);
              }
            )
        );
      },
    );
  }
}