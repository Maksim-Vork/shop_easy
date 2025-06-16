import 'package:chill_market/features/cart/domain/repository/cart_repository.dart';

class DeleteProductCartUsecase {
  final CartRepository cartRepository;

  DeleteProductCartUsecase({required this.cartRepository});

  Future<void> call(int id) async {
    await cartRepository.deleteProduct(id);
  }
}
