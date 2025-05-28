import 'package:chill_market/core/ApiService/dio_service.dart';
import 'package:chill_market/core/ThemeService/theme.dart';
import 'package:chill_market/features/auth/data/datasourse/auth_remote_data_source.dart';
import 'package:chill_market/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chill_market/features/auth/domain/repository/auth_repository.dart';
import 'package:chill_market/features/auth/domain/usecase/login_usecase.dart';
import 'package:chill_market/features/auth/domain/usecase/register_usecase.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/bloc/login_bloc.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/login_screen.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_bloc.dart';

import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final DioService dioService = DioService();
  final AuthRemoteDataSource authRemoteData = AuthRemoteDataSource(
    dioService: dioService,
  );
  final AuthRepository authRepository = AuthRepositoryImpl(
    authRemoteData: authRemoteData,
  );
  final LoginUsecase loginUseCase = LoginUsecase(
    authRepository: authRepository,
  );
  final RegisterUsecase registerUsecase = RegisterUsecase(
    authRepository: authRepository,
  );

  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder:
    //       (context) =>
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(loginUseCase)),
        BlocProvider(create: (context) => RegisterBloc(registerUsecase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        theme: lightTheme,
        home: LoginScreen(),
      ),
    ),
    // ),
  );
}
