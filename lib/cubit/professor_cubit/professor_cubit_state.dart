part of 'professor_cubit.dart';

class ProfessorCubitState extends Equatable {
  final PageStatus status;
  final ProfessorDto professorDto;

  const ProfessorCubitState({
    this.status = PageStatus.initial,
    this.professorDto = const ProfessorDto()
  });

  ProfessorCubitState copyWith({
    PageStatus? status,
    ProfessorDto? professorDto,
  }) {
    return ProfessorCubitState(
      status: status ?? this.status,
      professorDto: professorDto ?? this.professorDto,
    );
  }

  @override
  List<Object> get props => [status, professorDto];

}
