import 'package:chill_market/features/catalog/domain/entity/product.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Product> productsSort;

  CategoryLoaded({required this.productsSort});
}

class CategoryError extends CategoryState {
  final String error;

  CategoryError({required this.error});
}
