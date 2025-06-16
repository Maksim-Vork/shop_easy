import 'package:chill_market/features/cart/domain/entity/product.dart';
import 'package:hive/hive.dart';
part 'productс_model.g.dart';

@HiveType(typeId: 1)
class ProductCModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String images;

  ProductCModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  factory ProductCModel.fromEntity(ProductC productC) {
    return ProductCModel(
      id: productC.id,
      title: productC.title,
      price: productC.price,
      description: productC.description,
      images: productC.images,
    );
  }
  ProductC toEntity() {
    return ProductC(
      id: id,
      title: title,
      price: price,
      description: description,
      images: images,
    );
  }
}
