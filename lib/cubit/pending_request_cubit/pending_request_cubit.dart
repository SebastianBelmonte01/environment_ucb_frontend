import 'package:bloc/bloc.dart';
import 'package:environment_ucb/dto/request_dto.dart';
import 'package:environment_ucb/dto/reservation_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../services/request_service.dart';
import '../../services/reservation_service.dart';
import '../page_status.dart';

part 'pending_request_state.dart';

class PendingRequestCubit extends Cubit<PendingRequestState> {
  PendingRequestCubit() : super(PendingRequestState());

  Future<void> getMyPendingRequests() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      List<RequestDto> requests = await RequestService.getMyPendingRequests();
      emit(state.copyWith(status: PageStatus.success, requests: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  Future<void> cancelRequest(int id) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      await RequestService.cancelRequest(id);
      List<RequestDto> requests = await RequestService.getMyPendingRequests();
      emit(state.copyWith(status: PageStatus.success, requests: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  Future<void> getAdminPendingRequest() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      print("ON PENDING");
      List<RequestDto> requests = await ReservationService.getAdminPendingRequest();
      emit(state.copyWith(status: PageStatus.success, requests: requests));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  Future<void> aproveRequest(int requestId) async{
    emit(state.copyWith(status: PageStatus.loading));
    try {
      await RequestService.adminAcceptPendingRequest(requestId);
      List<RequestDto> requests = await ReservationService.getAdminPendingRequest();
      emit(state.copyWith(status: PageStatus.success, requests: requests));
    }
    catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }


  }


}
