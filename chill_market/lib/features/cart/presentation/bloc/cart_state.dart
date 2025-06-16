import 'package:chill_market/features/cart/domain/entity/product_cart.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ProductCart> cart;

  CartLoaded({required this.cart});
}

class CartError extends CartState {
  final String error;

  CartError({required this.error});
}
