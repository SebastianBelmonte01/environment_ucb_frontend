part of 'professor_cubit.dart';

class ProfessorCubitState extends Equatable {
  final PageStatus status;
  final ProfessorDto professorDto;
  final int selectedSubjectIndex;
  final int selectedParallelIndex;

  const ProfessorCubitState({
    this.status = PageStatus.initial,
    this.professorDto = const ProfessorDto(),
    this.selectedSubjectIndex = 0,
    this.selectedParallelIndex = 0,
  });

  ProfessorCubitState copyWith({
    PageStatus? status,
    ProfessorDto? professorDto,
    int? selectedSubjectIndex,
    int? selectedParallelIndex,
  }) {
    return ProfessorCubitState(
      status: status ?? this.status,
      professorDto: professorDto ?? this.professorDto,
      selectedSubjectIndex: selectedSubjectIndex ?? this.selectedSubjectIndex,
      selectedParallelIndex: selectedParallelIndex ?? this.selectedParallelIndex,
    );
  }

  @override
  List<Object?> get props => [
        status,
        professorDto,
        selectedSubjectIndex,
        selectedParallelIndex,
      ];

}
