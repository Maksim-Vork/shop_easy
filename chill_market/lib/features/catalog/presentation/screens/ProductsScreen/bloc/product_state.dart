import 'package:chill_market/features/catalog/domain/entity/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded({required this.product});
}

class ProductError extends ProductState {
  final String error;

  ProductError({required this.error});
}
