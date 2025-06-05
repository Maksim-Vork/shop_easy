import 'package:chill_market/core/Service/LocalStoredToken/auth_local_token.dart';
import 'package:chill_market/core/bloc_auth/auth_event.dart';
import 'package:chill_market/core/bloc_auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLocalTokenService authLocalTokenService;
  AuthBloc(this.authLocalTokenService) : super(AuthInitialState()) {
    on<CheckAuthEvent>(_onCheck);
    on<LogoutAuthsEvent>(_onLogout);
  }

  void _onCheck(CheckAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final token = await authLocalTokenService.getToken();

    if (token != null) {
      emit(SuccesAuthState());
    } else {
      emit(NotAuthState());
    }
  }

  void _onLogout(LogoutAuthsEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    await authLocalTokenService.deletedToken();
    emit(NotAuthState());
  }
}
