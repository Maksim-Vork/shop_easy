import 'package:chill_market/core/Service/ApiService/dio_service.dart';
import 'package:chill_market/core/Service/HiveService/hive_service.dart';
import 'package:chill_market/core/Service/LocalStoredToken/auth_local_token.dart';
import 'package:chill_market/features/auth/data/datasourse/auth_remote_data_source.dart';
import 'package:chill_market/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chill_market/features/auth/domain/repository/auth_repository.dart';
import 'package:chill_market/features/auth/domain/usecase/login_usecase.dart';
import 'package:chill_market/features/auth/domain/usecase/register_usecase.dart';
import 'package:chill_market/features/cart/data/datasource/cart_datasource.dart';
import 'package:chill_market/features/cart/data/repository/cart_repository_impl.dart';
import 'package:chill_market/features/cart/domain/repository/cart_repository.dart';
import 'package:chill_market/features/cart/domain/usecase/add_product_cart.dart';
import 'package:chill_market/features/cart/domain/usecase/delete_product_cart.dart';
import 'package:chill_market/features/cart/domain/usecase/edit_count_product.dart';
import 'package:chill_market/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:chill_market/features/catalog/data/datasource/catalog_remote_data.dart';
import 'package:chill_market/features/catalog/data/repository/catalog_repository_impl.dart';
import 'package:chill_market/features/catalog/domain/repository/catalog_repository.dart';
import 'package:chill_market/features/catalog/domain/usecase/get_list_product.dart';
import 'package:chill_market/features/catalog/domain/usecase/get_product_by_id.dart';
import 'package:chill_market/features/profile/data/datasource/settings_datasource.dart';
import 'package:chill_market/features/profile/data/repository/SettingsRepositoryImpl.dart';
import 'package:chill_market/features/profile/domain/repository/repository_settings.dart';
import 'package:chill_market/features/profile/domain/usecase/edit_settings_usecase.dart';
import 'package:chill_market/features/profile/domain/usecase/get_settings_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  getIt.registerLazySingleton<AuthLocalTokenService>(
    () => AuthLocalTokenService(prefs: getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<DioService>(
    () => DioService(getIt<AuthLocalTokenService>()),
  );
  // data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(dioService: getIt<DioService>()),
  );
  getIt.registerLazySingleton<CatalogRemoteDataSource>(
    () => CatalogRemoteDataSource(dioService: getIt<DioService>()),
  );
  getIt.registerLazySingleton<CartDatasource>(
    () => CartDatasource(hiveService: getIt<HiveService>()),
  );
  getIt.registerLazySingleton<SettingsDatasource>(
    () => SettingsDatasource(hiveService: getIt<HiveService>()),
  );

  //repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authLocalTokenService: getIt<AuthLocalTokenService>(),
      authRemoteData: getIt<AuthRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<CatalogRepository>(
    () => CatalogRepositoryImpl(
      catalogRemoteData: getIt<CatalogRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(cartDatasource: getIt<CartDatasource>()),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () =>
        Settingsrepositoryimpl(settingsDatasource: getIt<SettingsDatasource>()),
  );
  //usecase
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetListProductUsecase>(
    () => GetListProductUsecase(catalogRepository: getIt<CatalogRepository>()),
  );
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<AddProductCartUsecase>(
    () => AddProductCartUsecase(cartRepository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<DeleteProductCartUsecase>(
    () => DeleteProductCartUsecase(cartRepository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<EditCountProductUsecase>(
    () => EditCountProductUsecase(cartRepository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<GetCartUsecase>(
    () => GetCartUsecase(cartRepository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<EditSettingsUsecase>(
    () => EditSettingsUsecase(settingsRepository: getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<GetSettingsUsecase>(
    () => GetSettingsUsecase(settingsRepository: getIt<SettingsRepository>()),
  );
  getIt.registerLazySingleton<GetProductById>(
    () => GetProductById(catalogRepository: getIt<CatalogRepository>()),
  );
}
