import 'package:chill_market/core/Service/HiveService/hive_service.dart';
import 'package:chill_market/core/Service/LocatorService/get_it.dart';
import 'package:chill_market/core/Service/ThemeService/theme.dart';
import 'package:chill_market/core/bloc_auth/bloc_auth_export.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/bloc/login_bloc.dart';
import 'package:chill_market/features/auth/presentation/page/login_screen/login_screen.dart';
import 'package:chill_market/features/auth/presentation/page/register_screen/bloc/register_bloc.dart';
import 'package:chill_market/features/profile/presentation/bloc/settings_bloc_export.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_bloc.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/bloc/product_list_bloc.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/bloc/product_bloc.dart';
import 'package:chill_market/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final HiveService hiveService = HiveService();
  await hiveService.init();
  await setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => AuthBloc()..add(CheckAuthEvent())),
        BlocProvider(create: (context) => ProductListBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => CartBloc()..add(GetCartEvent())),
        BlocProvider(create: (context) => SettingsBloc()..add(GetSettings())),
        BlocProvider(create: (context) => ProductBloc()),
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
