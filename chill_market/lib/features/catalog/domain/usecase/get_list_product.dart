import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/repository/catalog_repository.dart';

class GetListProductUsecase {
  final CatalogRepository catalogRepository;

  GetListProductUsecase({required this.catalogRepository});

  Future<List<Product>> call() async {
    final List<Product> products = await catalogRepository.getListProduct();
    return products;
  }
}
