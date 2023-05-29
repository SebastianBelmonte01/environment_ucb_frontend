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
  String? reasonRej;
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
    this.reasonRej,
    this.reason,
    this.environment,
    this.classroom,
    this.building,
  });

  
  ReservationDto.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservationId'];
    requestId = json['requestId'];
    professorName = json['professorName'];
    reservationDate = json['reservationDate'];
    reservationTimeInit = json['reservationTimeInit'];
    reservationTimeEnd = json['reservationTimeEnd'];
    subject = json['subject'];
    parallel = json['parallel'];
    people = json['people'];
    requestState = json['requestState'];
    reasonRej = json['reasonRej'];
    reason = json['reason'];
    environment = json['environment'];
    classroom = json['classroom'];
    building = json['building'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reservationId'] = this.reservationId;
    data['requestId'] = this.requestId;
    data['professorName'] = this.professorName;
    data['reservationDate'] = this.reservationDate;
    data['reservationTimeInit'] = this.reservationTimeInit;
    data['reservationTimeEnd'] = this.reservationTimeEnd;
    data['subject'] = this.subject;
    data['parallel'] = this.parallel;
    data['people'] = this.people;
    data['requestState'] = this.requestState;
    data['reasonRej'] = this.reasonRej;
    data['reason'] = this.reason;
    data['environment'] = this.environment;
    data['classroom'] = this.classroom;
    data['building'] = this.building;
    return data;
  }

  @override
  String toString() {
    return 'ReservationDto(reservationId: $reservationId, requestId: $requestId, professorName: $professorName, reservationDate: $reservationDate, reservationTimeInit: $reservationTimeInit, reservationTimeEnd: $reservationTimeEnd, subject: $subject, parallel: $parallel, people: $people, requestState: $requestState, reasonRej: $reasonRej, reason: $reason, environment: $environment, classroom: $classroom, building: $building)';
  }

}