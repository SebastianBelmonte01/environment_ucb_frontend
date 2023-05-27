import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../dto/professor_dto.dart';
import '../../services/professor_service.dart';
import '../page_status.dart';

part 'professor_cubit_state.dart';

class ProfessorCubit extends Cubit<ProfessorCubitState> {
  ProfessorCubit() : super(const ProfessorCubitState());

  Future <void> getProfessor() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      ProfessorDto professorDto = await ProfessorService.getProfessor();
      emit(state.copyWith(status: PageStatus.success, professorDto: professorDto));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

}
