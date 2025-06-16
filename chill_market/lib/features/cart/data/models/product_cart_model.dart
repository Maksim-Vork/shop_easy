import 'package:chill_market/features/cart/data/models/product%D1%81_model.dart';
import 'package:chill_market/features/cart/domain/entity/product_cart.dart';
import 'package:hive/hive.dart';
part 'product_cart_model.g.dart';

@HiveType(typeId: 0)
class ProductCartModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final ProductCModel product;
  @HiveField(2)
  final int count;

  factory ProductCartModel.fromEntity(ProductCart productC) {
    return ProductCartModel(
      product: ProductCModel.fromEntity(productC.product),
      count: productC.count,
      id: productC.id,
    );
  }

  ProductCartModel({
    required this.id,
    required this.product,
    required this.count,
  });
  ProductCart toEntity() {
    return ProductCart(product: product.toEntity(), count: count, id: id);
  }
}
