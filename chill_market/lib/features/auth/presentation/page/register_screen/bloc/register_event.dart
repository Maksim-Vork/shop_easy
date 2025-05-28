abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  RegisterUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
