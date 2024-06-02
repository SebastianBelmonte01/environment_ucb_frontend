import 'package:bloc/bloc.dart';
import 'package:environment_ucb/dto/request_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../services/request_service.dart';
import '../page_status.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestState());

  Future<void> postRequest(String environment, String subject, int parallel,
      int people, String reason) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      RequestDto newRequest = RequestDto(
        date: DateFormat('yyyy-MM-dd').format(state.date!),
        initTime: DateFormat('HH:mm:ss').format(state.initTime!),
        endTime: DateFormat('HH:mm:ss').format(state.endTime!),
        environment: environment,
        subject: subject,
        parallel: parallel,
        people: people,
        reason: reason,
      );
      RequestDto response = await RequestService.postRequest(newRequest);
      RequestDto result = await RequestService.getLastRequest();
      print("Response:  $result");
      emit(state.copyWith(status: PageStatus.success, request: result));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  void setDate(DateTime date) {
    emit(state.copyWith(date: date));
  }

  void setInitTime(DateTime initTime) {
    if (state.endTime != null) {
      if (isValidInitTime(initTime, state.endTime!)) {
        emit(state.copyWith(initTime: initTime));
      }
    } else {
      emit(state.copyWith(initTime: initTime));
    }
  }

  void setEndTime(DateTime endTime) {
    if (state.initTime != null) {
      if (isValidEndTime(state.initTime!, endTime)) {
        emit(state.copyWith(endTime: endTime));
      }else{
        emit(state.copyWith(endTime: null));
      }
    } else {
      emit(state.copyWith(endTime: endTime));
    }
  }

  bool isValidInitTime(DateTime initTime, DateTime endTime) {
    return initTime.isBefore(endTime) &&
        endTime.difference(initTime).inHours >= 1;
  }

  bool isValidEndTime(DateTime initTime, DateTime endTime) {
    return endTime.isAfter(initTime) && endTime.difference(initTime).inHours >= 1;
  }

  void setSelectedRequest(RequestDto requestDto) {
    emit(state.copyWith(request: requestDto));
  }
}
