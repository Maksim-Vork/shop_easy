import 'package:chill_market/features/auth/domain/entity/login.dart';
import 'package:chill_market/features/auth/domain/entity/register.dart';

abstract class AuthRepository {
  Future<String> login(Login login);
  Future<void> register(Register register);
}
