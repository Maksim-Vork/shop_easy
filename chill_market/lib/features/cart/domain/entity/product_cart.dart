import 'package:chill_market/features/cart/domain/entity/product.dart';

class ProductCart {
  final int id;
  final ProductC product;
  final int count;

  ProductCart({required this.id, required this.product, required this.count});
}
