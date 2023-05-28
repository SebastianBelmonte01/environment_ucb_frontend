part of 'request_cubit.dart';

class RequestState extends Equatable {
  final PageStatus status;
  final DateTime? date;
  final DateTime? initTime;
  final DateTime? endTime;
  final String? environment;
  final String? subject;
  final int? parallel;
  final int? people;
  final String? reason;

  const RequestState({
    this.status = PageStatus.initial,
    this.date ,
    this.initTime,
    this.endTime,
    this.environment,
    this.subject,
    this.parallel,
    this.people,
    this.reason,
  });

  RequestState copyWith({
    PageStatus? status,
    DateTime? date,
    DateTime? initTime,
    DateTime? endTime,
    String? environment,
    String? subject,
    int? parallel,
    int? people,
    String? reason,
  }) {
    return RequestState(
      status: status ?? this.status,
      date: date ?? this.date,
      initTime: initTime ?? this.initTime,
      endTime: endTime ?? this.endTime,
      environment: environment ?? this.environment,
      subject: subject ?? this.subject,
      parallel: parallel ?? this.parallel,
      people: people ?? this.people,
      reason: reason ?? this.reason,
    );
  }

  @override
  List<Object?> get props => [
        status,
        date,
        initTime,
        endTime,
        environment,
        subject,
        parallel,
        people,
        reason,
      ];
}
