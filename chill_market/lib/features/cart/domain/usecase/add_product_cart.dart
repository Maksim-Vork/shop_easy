import 'package:chill_market/features/cart/domain/entity/product_cart.dart';
import 'package:chill_market/features/cart/domain/repository/cart_repository.dart';

class AddProductCartUsecase {
  final CartRepository cartRepository;

  AddProductCartUsecase({required this.cartRepository});

  Future<void> call(ProductCart productCart) async {
    await cartRepository.addProductCart(productCart);
  }
}
