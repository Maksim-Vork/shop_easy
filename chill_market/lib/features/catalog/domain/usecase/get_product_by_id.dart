import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/repository/catalog_repository.dart';

class GetProductById {
  final CatalogRepository catalogRepository;

  GetProductById({required this.catalogRepository});

  Future<Product> call(int id) async {
    final Product product = await catalogRepository.getProductById(id);
    return product;
  }
}
