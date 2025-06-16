import 'package:chill_market/features/cart/data/datasource/cart_datasource.dart';
import 'package:chill_market/features/cart/data/models/product_cart_model.dart';
import 'package:chill_market/features/cart/domain/entity/product_cart.dart';
import 'package:chill_market/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final CartDatasource cartDatasource;

  CartRepositoryImpl({required this.cartDatasource});

  @override
  Future<void> addProductCart(ProductCart productCart) async {
    final ProductCartModel productCartModel = ProductCartModel.fromEntity(
      productCart,
    );
    await cartDatasource.addProduct(productCartModel);
  }

  @override
  Future<void> deleteProduct(int id) async {
    await cartDatasource.deleteProduct(id);
  }

  @override
  Future<void> editCountProduct(ProductCart productCart) async {
    final ProductCartModel productCartModel = ProductCartModel.fromEntity(
      productCart,
    );
    await cartDatasource.editProduct(productCartModel);
  }

  @override
  Future<List<ProductCart>> getCart() async {
    final List<ProductCartModel> productsJson = await cartDatasource.getCart();
    final List<ProductCart> products =
        productsJson.map((e) => e.toEntity()).toList();

    return products;
  }
}
