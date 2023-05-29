part of 'request_cubit.dart';

class RequestState extends Equatable {
  final PageStatus status;
  final DateTime? date;
  final DateTime? initTime;
  final DateTime? endTime;
  final RequestDto? request;

  RequestState({
    this.status = PageStatus.initial,
    this.date,
    this.initTime,
    this.endTime,
    this.request,
  });

  RequestState copyWith({
    PageStatus? status,
    DateTime? date,
    DateTime? initTime,
    DateTime? endTime,
    RequestDto? request,
  }) {
    return RequestState(
      status: status ?? this.status,
      date: date ?? this.date,
      initTime: initTime ?? this.initTime,
      endTime: endTime ?? this.endTime,
      request: request ?? this.request,
    );
  }

  @override
  List<Object?> get props => [status, date, initTime, endTime, request];

}