import 'package:chill_market/features/catalog/domain/entity/category.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final String description;
  final MyCategory category;
  final List<String> images;

  Product(
    this.category,
    this.images, {
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });
}
