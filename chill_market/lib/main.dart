import 'package:chill_market/core/Service/ApiService/dio_service.dart';
import 'package:chill_market/core/Service/LocalStoredToken/auth_local_token.dart';
import 'package:chill_market/core/Service/ThemeService/theme.dart';
import 'package:chill_market/core/bloc_auth/auth_bloc.dart';
import 'package:chill_market/core/bloc_auth/auth_event.dart';
import 'package:chill_market/core/bloc_auth/auth_state.dart';
import 'package:chill_market/features/auth/data/datasourse/auth_remote_data_source.dart';
import 'package:chill_market/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chill_market/features/auth/domain/repository/auth_repository.dart';
import 'package:chill_market/features/auth/domain/usecase/login_usecase.dart';
import 'package:chill_market/features/auth/domain/usecase/register_usecase.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/bloc/login_bloc.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/login_screen.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_bloc.dart';
import 'package:chill_market/features/catalog/data/datasource/catalog_remote_data.dart';
import 'package:chill_market/features/catalog/data/repository/catalog_repository_impl.dart';
import 'package:chill_market/features/catalog/domain/repository/catalog_repository.dart';
import 'package:chill_market/features/catalog/domain/usecase/get_list_product.dart';
import 'package:chill_market/features/catalog/domain/usecase/get_list_products_by_slug.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_bloc.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/bloc/product_list_bloc.dart';
import 'package:chill_market/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final AuthLocalTokenService authLocalTokenService = AuthLocalTokenService(
    prefs: prefs,
  );

  final DioService dioService = DioService(authLocalTokenService);
  final AuthRemoteDataSource authRemoteData = AuthRemoteDataSource(
    dioService: dioService,
  );
  final AuthRepository authRepository = AuthRepositoryImpl(
    authRemoteData: authRemoteData,
    authLocalTokenService: authLocalTokenService,
  );
  final LoginUsecase loginUseCase = LoginUsecase(
    authRepository: authRepository,
  );
  final CatalogRemoteData catalogRemoteData = CatalogRemoteData(
    dioService: dioService,
  );
  final CatalogRepository catalogRepository = CatalogRepositoryImpl(
    catalogRemoteData: catalogRemoteData,
  );
  final GetListProductUsecase getListProductUsecase = GetListProductUsecase(
    catalogRepository: catalogRepository,
  );
  final RegisterUsecase registerUsecase = RegisterUsecase(
    authRepository: authRepository,
  );
  final GetListProductsBySlug getListProductsBySlug = GetListProductsBySlug(
    catalogRepository: catalogRepository,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc(loginUseCase)),
        BlocProvider(create: (context) => RegisterBloc(registerUsecase)),
        BlocProvider(
          create:
              (context) =>
                  AuthBloc(authLocalTokenService)..add(CheckAuthEvent()),
        ),
        BlocProvider(
          create: (context) => ProductListBloc(getListProductUsecase),
        ),
        BlocProvider(create: (context) => CategoryBloc(getListProductsBySlug)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        theme: lightTheme,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitialState || state is AuthLoadingState) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is SuccesAuthState) {
              return MainScaffold();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    ),
  );
}
