import 'package:bloc/bloc.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/dto/api_response.dart';
import 'package:environment_ucb/services/login_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(const RegistrationState());


  Future <void> createAccount(String email, String secret) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      print("Entrando a servicio");
      await LoginService.createAccount(email, secret);
      emit(state.copyWith(
          status: PageStatus.success, email: email, secret: secret));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }
}
