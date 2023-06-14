import 'package:equatable/equatable.dart';
import 'package:environment_ucb/cubit/page_status.dart';

class LoginState extends Equatable {
  final String email;
  final String secret;
  final bool isAdmin;
  final PageStatus? status;

  const LoginState({
    this.status = PageStatus.initial,
    this.email = "",
    this.secret = "",
    this.isAdmin = false,
  });

  LoginState copyWith({
    PageStatus? status, String? email,  String? secret, bool? isAdmin,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      secret: secret ?? this.secret,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        secret,
        isAdmin,
  ];
}
