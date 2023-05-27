import 'package:environment_ucb/dto/subject_dto.dart';

class ProfessorDto {
  final int? professorId;
  final String? name;
  final List<SubjectDto>? subjects;

  const ProfessorDto({
    this.professorId,
    this.name,
    this.subjects,
  });

  factory ProfessorDto.fromJson(Map<String, dynamic> json) {
    return ProfessorDto(
      professorId: json['professorId'],
      name: json['name'],
      subjects: List<SubjectDto>.from(
          json['subjects']?.map((subject) => SubjectDto.fromJson(subject))),
    );
  }

  Map<String, dynamic> toJson() => {
        'professorId': professorId,
        'name': name,
        'subjects': subjects?.map((subject) => subject.toJson()).toList(),
      };
}
