part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  final String email;
  final String secret;
  final PageStatus? status;
  
  const RegistrationState({
    this.status = PageStatus.initial,
    this.email = "",
    this.secret = ""
  });

  RegistrationState copyWith({
    PageStatus? status, String? email,  String? secret
  }) {
    return RegistrationState (
      status: status ?? this.status,
      email: email ?? this.email,
      secret: secret ?? this.secret
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        secret
  ];




}

