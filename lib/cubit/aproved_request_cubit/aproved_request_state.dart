part of 'aproved_request_cubit.dart';

class AprovedRequestState extends Equatable {
  final PageStatus status;
  final List<ReservationDto> reservationList;
  final ReservationDto reservation;

  AprovedRequestState({
  this.status = PageStatus.initial,
  this.reservationList = const [],
  ReservationDto? reservation,
}) : reservation = reservation ?? ReservationDto();


  AprovedRequestState copyWith({
    PageStatus? status,
    List<ReservationDto>? reservationList,
    ReservationDto? reservation,
  }) {
    return AprovedRequestState(
      status: status ?? this.status,
      reservationList: reservationList ?? this.reservationList,
      reservation: reservation ?? this.reservation,
    );
  }

  @override
  List<Object> get props => [status, reservationList, reservation];
}

