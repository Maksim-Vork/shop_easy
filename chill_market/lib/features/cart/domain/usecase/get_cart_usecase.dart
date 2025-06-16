import 'package:chill_market/features/cart/domain/entity/product_cart.dart';
import 'package:chill_market/features/cart/domain/repository/cart_repository.dart';

class GetCartUsecase {
  final CartRepository cartRepository;

  GetCartUsecase({required this.cartRepository});

  Future<List<ProductCart>> call() async {
    final List<ProductCart> cart = await cartRepository.getCart();
    return cart;
  }
}
