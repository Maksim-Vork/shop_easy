abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadig extends LoginState {}

class LoginSuccessful extends LoginState {
  final String token;

  LoginSuccessful({required this.token});
}

class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}
