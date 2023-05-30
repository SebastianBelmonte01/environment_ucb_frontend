import 'package:bloc/bloc.dart';
import 'package:environment_ucb/dto/reservation_dto.dart';
import 'package:environment_ucb/services/reservation_service.dart';
import 'package:equatable/equatable.dart';

import '../../dto/request_dto.dart';
import '../../services/request_service.dart';
import '../page_status.dart';

part 'aproved_request_state.dart';

class AprovedRequestCubit extends Cubit<AprovedRequestState> {
  AprovedRequestCubit() : super(AprovedRequestState());

  Future<void> getMyAprovedRequest() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      List<ReservationDto> requests = await ReservationService.getMyAccepetedRequest();
      emit(state.copyWith(status: PageStatus.success, reservationList: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  Future<void> getMyRejectedReservation() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      List<ReservationDto> requests = await ReservationService.getMyRejectedReservation();
      emit(state.copyWith(status: PageStatus.success, reservationList: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  Future<void> getAdminPendingRequest() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      print("ON PENDING");
      List<ReservationDto> requests = await ReservationService.getAdminPendingRequest();
      emit(state.copyWith(status: PageStatus.success, reservationList: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  void setSelectedReservation(ReservationDto reservationDto){
    emit(state.copyWith(reservation: reservationDto));
  }

}
