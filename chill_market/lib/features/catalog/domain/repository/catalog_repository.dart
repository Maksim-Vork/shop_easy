import 'package:chill_market/features/catalog/domain/entity/product.dart';

abstract class CatalogRepository {
  Future<List<Product>> getListProduct();
  Future<List<Product>> getListProductBySlug(String slug);
  Future<Product> getProductById(int id);
}
