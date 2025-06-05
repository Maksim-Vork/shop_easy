abstract class LoginEvent {}

class LogInEvent extends LoginEvent {
  final String email;
  final String password;

  LogInEvent({required this.email, required this.password});
}
