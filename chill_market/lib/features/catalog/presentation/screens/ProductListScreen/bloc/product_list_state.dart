import 'package:chill_market/features/catalog/domain/entity/product.dart';

abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final List<Product> products;

  ProductListLoaded({required this.products});
}

class ProductListError extends ProductListState {
  final String error;

  ProductListError({required this.error});
}
