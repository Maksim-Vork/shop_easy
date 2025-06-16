import 'package:chill_market/features/cart/domain/entity/product_cart.dart';

abstract class CartRepository {
  Future<void> addProductCart(ProductCart productCart);
  Future<void> deleteProduct(int id);
  Future<void> editCountProduct(ProductCart productCartModel);
  Future<List<ProductCart>> getCart();
}
