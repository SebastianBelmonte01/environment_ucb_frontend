class ReservationDto {
  int? reservationId;
  int? requestId;
  String? professorName;
  String? reservationDate;
  String? reservationTimeInit;
  String? reservationTimeEnd;
  String? subject;
  int? parallel;
  int? people;
  String? requestState;
  String? reasonRejection;
  String? reason;
  String? environment;
  int? classroom;
  String? building;

  ReservationDto({
    this.reservationId,
    this.requestId,
    this.professorName,
    this.reservationDate,
    this.reservationTimeInit,
    this.reservationTimeEnd,
    this.subject,
    this.parallel,
    this.people,
    this.requestState,
    this.reasonRejection,
    this.reason,
    this.environment,
    this.classroom,
    this.building,
  });


  factory ReservationDto.fromJson(Map<String, dynamic> json) {
    return ReservationDto(
      reservationId: json['reservationId'] as int?,
      requestId: json['requestId'] as int?,
      professorName: json['professorName'] as String?,
      reservationDate: json['reservationDate'] as String?,
      reservationTimeInit: json['reservationTimeInit'] as String?,
      reservationTimeEnd: json['reservationTimeEnd'] as String?,
      subject: json['subject'] as String?,
      parallel: json['parallel'] as int?,
      people: json['people'] as int?,
      requestState: json['requestState'] as String?,
      reasonRejection: json['reasonRejection'] as String?,
      reason: json['reason'] as String?,
      environment: json['environment'] as String?,
      classroom: json['classroom'] as int?,
      building: json['building'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservationId': reservationId,
      'requestId': requestId,
      'professorName': professorName,
      'reservationDate': reservationDate,
      'reservationTimeInit': reservationTimeInit,
      'reservationTimeEnd': reservationTimeEnd,
      'subject': subject,
      'parallel': parallel,
      'people': people,
      'requestState': requestState,
      'reasonRejection': reasonRejection,
      'reason': reason,
      'environment': environment,
      'classroom': classroom,
      'building': building,
    };
  }

}