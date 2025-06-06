import 'package:chill_market/core/Service/ApiService/dio_service.dart';
import 'package:chill_market/features/catalog/data/model/product_model.dart';

class CatalogRemoteData {
  final DioService dioService;

  CatalogRemoteData({required this.dioService});

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dioService.get('products');
      final List<ProductModel> products = response.data as List<ProductModel>;
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
