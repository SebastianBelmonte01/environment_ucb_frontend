import 'package:bloc/bloc.dart';
import 'package:environment_ucb/cubit/login_cubit/login_state.dart';
import 'package:environment_ucb/cubit/page_status.dart';
import 'package:environment_ucb/dto/api_response.dart';
import 'package:environment_ucb/services/login_service.dart';
import 'package:jwt_decode/jwt_decode.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  Future<void> login(String email, String secret) async {
    print(email + secret);
    emit(state.copyWith(status: PageStatus.loading));
    try {
      // ignore: unused_local_variable
      ApiResponse res = await LoginService.login(email, secret);
      bool isAdmin = Jwt.parseJwt(res.response.authToken)['isAdmin'];
      print("is admin: " + isAdmin.toString());
      emit(state.copyWith(status: PageStatus.success, email: email, isAdmin:isAdmin));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  void reset() {
    emit(const LoginState());
  }
}
