import 'package:bloc/bloc.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/dto/environment_dto.dart';
import 'package:equatable/equatable.dart';

import '../../services/environment_service.dart';

part 'environment_state.dart';

class EnvironmentCubit extends Cubit<EnvironmentState> {
  EnvironmentCubit() : super(const EnvironmentState());

  Future<void> getEnvironments() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      List<EnvironmentDto> environmentList = await EnvironmentService.getEnvironments();
      //Print the environments
      environmentList.forEach((element) {
        print(element.type);
      });

      emit(state.copyWith(status: PageStatus.success, environments: environmentList));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  //Search the environment by name
  void changeSelectedEnvironment(String environmentName) {
    int index = state.environments.indexWhere((element) => element.type == environmentName);
    emit(state.copyWith(selectedEnvironmentIndex: index));
  }
}
