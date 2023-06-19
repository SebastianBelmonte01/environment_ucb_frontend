import 'package:bloc/bloc.dart';
import 'package:environment_ucb/dto/entrance_dto.dart';
import 'package:environment_ucb/dto/reservation_dto.dart';
import 'package:environment_ucb/services/entrance_service.dart';
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

  Future<void> deleteReservation(int id) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      await ReservationService.deleteReservation(id);
      List<ReservationDto> requests = await ReservationService.getMyAccepetedRequest();
      emit(state.copyWith(status: PageStatus.success, reservationList: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }
  

  void setSelectedReservation(ReservationDto reservationDto){
    print("Reservation ID ${reservationDto.reservationId}");
    emit(state.copyWith(reservation: reservationDto));
  }

  void getMyCompletedRequests() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      List<ReservationDto> requests = await ReservationService.getMyCompletedRequests();
      emit(state.copyWith(status: PageStatus.success, reservationList: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  Future<void> acceptRejectionRequest(int reservationId) async{
    emit(state.copyWith(status: PageStatus.loading));
    try {
      await ReservationService.acceptRejectedRequest(reservationId);
      List<ReservationDto> requests = await ReservationService.getMyRejectedReservation();
      emit(state.copyWith(status: PageStatus.success, reservationList: requests));
    }
    catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }

  }

  Future<void> registerEntrance(String environment, int idReservation) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      List<String> parts = environment.split('-');
      String building = parts[0]; // "Building"
      int classroom = int.parse(parts[1]); // Classroom
      EntranceDto entrance = EntranceDto(reservationId: idReservation, classroom: classroom, building: building);
      String entranceDto = await EntranceService.registerEntrance(entrance);
      List<ReservationDto> requests = await ReservationService.getMyCompletedRequests();
      emit(state.copyWith(status: PageStatus.success, entranceDto: entrance, message: entranceDto, reservationList: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

}
