part of 'pending_request_cubit.dart';

class PendingRequestState extends Equatable {
  final PageStatus status;
  final List<RequestDto> requests;

  const PendingRequestState({
    this.status = PageStatus.initial,
    this.requests = const [],
  });

  PendingRequestState copyWith({
    PageStatus? status,
    List<RequestDto>? requests,
  }) {
    return PendingRequestState(
      status: status ?? this.status,
      requests: requests ?? this.requests,
    );
  }

  @override
  List<Object?> get props => [
        status,
        requests,
      ];
}
