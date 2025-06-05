import 'package:chill_market/features/auth/domain/entity/register.dart';
import 'package:chill_market/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecase({required this.authRepository});

  Future<void> call(Register register) async {
    await authRepository.register(register);
  }
}
