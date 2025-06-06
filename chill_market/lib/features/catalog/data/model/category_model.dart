import 'package:chill_market/features/catalog/domain/entity/category.dart';

class CategoryModel {
  final String name;
  final String slug;

  CategoryModel({required this.name, required this.slug});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name'], slug: json['slug']);
  }

  MyCategory toEntity() {
    return MyCategory(name: name, slug: slug);
  }
}
