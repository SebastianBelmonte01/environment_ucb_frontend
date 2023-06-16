import 'package:bloc/bloc.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/dto/entrance_dto.dart';
import 'package:environment_ucb/services/entrance_service.dart';
import 'package:equatable/equatable.dart';

part 'entrance_state.dart';

class EntranceCubit extends Cubit<EntranceState> {
  EntranceCubit() : super(EntranceState());

  Future<void> registerEntrance(String environment, int idReservation) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      print("QR ENTRACE: $environment");
      List<String> parts = environment.split('-');

      String building = parts[0]; // "Building"
      print("Building: $building");
      int classroom = int.parse(parts[1]); // Classroom
      print("Classroom: $classroom");
      EntranceDto entrance = EntranceDto(reservationId: idReservation, classroom: classroom, building: building);
      String entranceDto = await EntranceService.registerEntrance(entrance);
      emit(state.copyWith(status: PageStatus.success, entranceDto: entrance, message: entranceDto));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }



}
