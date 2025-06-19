abstract class ProductEvent {}

class GetProductByIdEvent extends ProductEvent {
  final int id;

  GetProductByIdEvent({required this.id});
}
