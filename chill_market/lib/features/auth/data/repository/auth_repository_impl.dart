import 'package:chill_market/core/Service/LocalStoredToken/auth_local_token.dart';
import 'package:chill_market/features/auth/data/datasourse/auth_remote_data_source.dart';
import 'package:chill_market/features/auth/data/models/login_model.dart';
import 'package:chill_market/features/auth/data/models/register_model.dart';
import 'package:chill_market/features/auth/domain/entity/login.dart';
import 'package:chill_market/features/auth/domain/entity/register.dart';
import 'package:chill_market/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalTokenService authLocalTokenService;
  final AuthRemoteDataSource authRemoteData;

  AuthRepositoryImpl({
    required this.authLocalTokenService,
    required this.authRemoteData,
  });

  @override
  Future<String> login(Login login) async {
    final LoginModel loginModel = LoginModel.fromEntity(login);
    final String token = await authRemoteData.login(loginModel);
    await authLocalTokenService.saveToken(token);
    return token;
  }

  @override
  Future<void> register(Register register) async {
    final RegisterModel registerModel = RegisterModel.fromEntity(register);
    await authRemoteData.register(registerModel);
  }
}
