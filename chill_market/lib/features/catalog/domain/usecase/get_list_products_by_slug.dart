import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/repository/catalog_repository.dart';

class GetListProductsBySlug {
  final CatalogRepository catalogRepository;

  GetListProductsBySlug({required this.catalogRepository});

  Future<List<Product>> call(String slug) async {
    final List<Product> products = await catalogRepository.getListProductBySlug(
      slug,
    );
    return products;
  }
}
