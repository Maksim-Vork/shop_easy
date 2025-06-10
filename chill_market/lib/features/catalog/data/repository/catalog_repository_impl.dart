import 'package:chill_market/features/catalog/data/datasource/catalog_remote_data.dart';
import 'package:chill_market/features/catalog/data/model/product_model.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/repository/catalog_repository.dart';

class CatalogRepositoryImpl extends CatalogRepository {
  final CatalogRemoteData catalogRemoteData;

  CatalogRepositoryImpl({required this.catalogRemoteData});

  @override
  Future<List<Product>> getListProduct() async {
    final List<ProductModel> productsModel =
        await catalogRemoteData.getProducts();

    final List<Product> products =
        productsModel.map((productsModel) => productsModel.toEntity()).toList();
    return products;
  }
}
