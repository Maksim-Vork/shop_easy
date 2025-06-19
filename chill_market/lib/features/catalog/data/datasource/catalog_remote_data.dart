import 'package:chill_market/core/Service/ApiService/dio_service.dart';
import 'package:chill_market/features/catalog/data/model/product_model.dart';

class CatalogRemoteDataSource {
  final DioService dioService;

  CatalogRemoteDataSource({required this.dioService});

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dioService.get('products');

      final List<dynamic> responseList = response.data;

      final List<ProductModel> products =
          responseList
              .map((product) => ProductModel.fromJson(product))
              .toList();

      return products;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getProductsBuSlug(String slug) async {
    try {
      final response = await dioService.get('products/?categorySlug=$slug');

      final List<dynamic> responseList = response.data;

      final List<ProductModel> products =
          responseList
              .map((product) => ProductModel.fromJson(product))
              .toList();

      return products;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await dioService.get('products/$id');
      final productJson = response.data;
      final ProductModel product = ProductModel.fromJson(productJson);
      return product;
    } catch (e) {
      throw Exception(e);
    }
  }
}
