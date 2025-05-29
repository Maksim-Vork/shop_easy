import 'package:chill_market/features/auth/domain/entity/register.dart';
import 'package:chill_market/features/auth/domain/usecase/register_usecase.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_event.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterBloc(this.registerUsecase) : super(RegisterInitial()) {
    on<RegisterUserEvent>(_onRegister);
  }

  void _onRegister(RegisterUserEvent event, Emitter<RegisterState> emit) async {
    try {
      emit(RegisterLoading());
      await registerUsecase(
        Register(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );
      emit(RegisterSucceseful());
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
}
