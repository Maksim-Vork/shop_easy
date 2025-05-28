class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucceseful extends RegisterState {}

class RegisterError extends RegisterState {
  final String error;

  RegisterError({required this.error});
}
