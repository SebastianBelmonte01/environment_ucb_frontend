import 'package:equatable/equatable.dart';
import 'package:environment_ucb/cubit/page_status.dart';

class LoginState extends Equatable {
  final String email;
  final String secret;
  final bool isAdmin;
  final int errorCount;
  final PageStatus? status;


  const LoginState({
    this.status = PageStatus.initial,
    this.email = "",
    this.secret = "",
    this.isAdmin = false,
    this.errorCount = 0,
  });

  LoginState copyWith({
    PageStatus? status, String? email,  String? secret, bool? isAdmin, int? errorCount
    
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      secret: secret ?? this.secret,
      isAdmin: isAdmin ?? this.isAdmin,
      errorCount: errorCount ?? this.errorCount,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        secret,
        isAdmin,
        errorCount,
  ];
}
