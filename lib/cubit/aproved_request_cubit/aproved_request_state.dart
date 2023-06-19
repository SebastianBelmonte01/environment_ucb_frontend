part of 'aproved_request_cubit.dart';

class AprovedRequestState extends Equatable {
  final PageStatus status;
  final List<ReservationDto> reservationList;
  final ReservationDto reservation;
  final EntranceDto? entranceDto;
  final String? message;


  AprovedRequestState({
  this.status = PageStatus.initial,
  this.reservationList = const [],
  this.entranceDto,
  this.message,
  ReservationDto? reservation,
}) : reservation = reservation ?? ReservationDto();


  AprovedRequestState copyWith({
    PageStatus? status,
    List<ReservationDto>? reservationList,
    ReservationDto? reservation,
    EntranceDto? entranceDto,
    String? message,
  }) {
    return AprovedRequestState(
      status: status ?? this.status,
      reservationList: reservationList ?? this.reservationList,
      reservation: reservation ?? this.reservation,
      entranceDto: entranceDto ?? this.entranceDto,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, reservationList, reservation];
}

