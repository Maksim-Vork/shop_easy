import 'package:chill_market/core/exceptions/app_exception.dart';
import 'package:chill_market/features/auth/domain/entity/login.dart';
import 'package:chill_market/features/auth/domain/usecase/login_usecase.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/bloc/login_event.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc(this.loginUsecase) : super(LoginInitial()) {
    on<LogInEvent>(_onLogin);
  }

  void _onLogin(LogInEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      final String token = await loginUsecase(
        Login(email: event.email, password: event.password),
      );
      emit(LoginSuccessful(token: token));
    } on AppException catch (e) {
      emit(LoginError(error: e.error));
    }
  }
}
