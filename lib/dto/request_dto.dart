class RequestDto {
  int? id;
  String? professroName;
  String? date;
  String? initTime;
  String? endTime;
  String? environment;
  String? subject;
  int? parallel;
  int? people;
  String? reason;
  String? state;

  RequestDto({
    this.id,
    this.professroName,
    this.date,
    this.initTime,
    this.endTime,
    this.environment,
    this.subject,
    this.parallel,
    this.people,
    this.reason,
    this.state,
  });

  factory RequestDto.fromJson(Map<String, dynamic> json) {
    return RequestDto(
      id: json['id'],
      professroName: json['professorName'],
      date: json['date'],
      initTime: json['initTime'],
      endTime: json['endTime'],
      environment: json['environment'],
      subject: json['subject'],
      parallel: json['parallel'],
      people: json['people'],
      reason: json['reason'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'professorName': professroName,
        'date': date,
        'initTime': initTime,
        'endTime': endTime,
        'environment': environment,
        'subject': subject,
        'parallel': parallel,
        'people': people,
        'reason': reason,
        'state': state,
      };

  @override
  String toString() {
    return 'RequestDto(id: $id, professroName: $professroName, date: $date, initTime: $initTime, endTime: $endTime, environment: $environment, subject: $subject, parallel: $parallel, people: $people, reason: $reason, state: $state)';
  }

}