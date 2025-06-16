import 'package:chill_market/features/cart/domain/entity/product_cart.dart';

abstract class CartEvent {}

class GetCartEvent extends CartEvent {}

class AddProductEvent extends CartEvent {
  final ProductCart productCart;

  AddProductEvent({required this.productCart});
}

class EditCountEvent extends CartEvent {
  final ProductCart productCart;
  final String work;

  EditCountEvent({required this.productCart, required this.work});
}

class DeleteProductEvent extends CartEvent {
  final int id;

  DeleteProductEvent({required this.id});
}
