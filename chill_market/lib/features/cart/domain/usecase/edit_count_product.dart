import 'package:chill_market/features/cart/domain/entity/product_cart.dart';
import 'package:chill_market/features/cart/domain/repository/cart_repository.dart';

class EditCountProductUsecase {
  final CartRepository cartRepository;

  EditCountProductUsecase({required this.cartRepository});

  Future<void> call(ProductCart productCartModel) async {
    await cartRepository.editCountProduct(productCartModel);
  }
}
