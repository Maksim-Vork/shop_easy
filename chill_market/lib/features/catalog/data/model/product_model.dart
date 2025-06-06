import 'package:chill_market/features/catalog/data/model/category_model.dart';
import 'package:chill_market/features/catalog/data/model/images_model.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';

class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final CategoryModel category;
  final ImagesModel images;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: CategoryModel.fromJson(json['category']),
      images: ImagesModel.fromJson(json['images']),
    );
  }

  Product toEntity() {
    return Product(
      category.toEntity(),
      images.toEntity(),
      id: id,
      title: title,
      price: price,
      description: description,
    );
  }
}
