import 'package:chill_market/core/Service/HiveService/hive_service.dart';
import 'package:chill_market/features/cart/data/models/product_cart_model.dart';

class CartDatasource {
  final HiveService hiveService;

  CartDatasource({required this.hiveService});

  Future<void> addProduct(ProductCartModel productCart) async {
    final boxCart = hiveService.getBox<ProductCartModel>('cartBox');
    await boxCart.put(productCart.id, productCart);
  }

  Future<void> deleteProduct(int id) async {
    final boxCart = hiveService.getBox<ProductCartModel>('cartBox');
    await boxCart.delete(id);
  }

  Future<void> editProduct(ProductCartModel productCart) async {
    final boxCart = hiveService.getBox<ProductCartModel>('cartBox');
    await boxCart.put(productCart.id, productCart);
  }

  Future<List<ProductCartModel>> getCart() async {
    final boxCart = hiveService.getBox<ProductCartModel>('cartBox');
    return boxCart.values.toList();
  }
}
