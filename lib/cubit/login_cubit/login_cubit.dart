import 'package:bloc/bloc.dart';
import 'package:environment_ucb/cubit/login_cubit/login_state.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/services/login_service.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  Future<void> login(String email, String secret) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      // ignore: unused_local_variable
      await LoginService.login(email, secret);
      emit(state.copyWith(status: PageStatus.success));
      // emit(state.copyWith(status: PageStatus.success, response: response));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  void reset() {
    emit(const LoginState());
  }
}
