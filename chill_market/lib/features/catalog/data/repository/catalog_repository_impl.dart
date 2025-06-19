import 'package:chill_market/features/catalog/data/datasource/catalog_remote_data.dart';
import 'package:chill_market/features/catalog/data/model/product_model.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/repository/catalog_repository.dart';

class CatalogRepositoryImpl extends CatalogRepository {
  final CatalogRemoteDataSource catalogRemoteData;

  CatalogRepositoryImpl({required this.catalogRemoteData});

  @override
  Future<List<Product>> getListProduct() async {
    final List<ProductModel> productsModel =
        await catalogRemoteData.getProducts();

    final List<Product> products =
        productsModel.map((productsModel) => productsModel.toEntity()).toList();
    return products;
  }

  @override
  Future<List<Product>> getListProductBySlug(String slug) async {
    final List<ProductModel> productsModel = await catalogRemoteData
        .getProductsBuSlug(slug);

    final List<Product> products =
        productsModel.map((productsModel) => productsModel.toEntity()).toList();
    return products;
  }

  @override
  Future<Product> getProductById(int id) async {
    final ProductModel productModel = await catalogRemoteData.getProductById(
      id,
    );
    final Product product = productModel.toEntity();
    return product;
  }
}
