import 'package:chill_market/features/cart/domain/entity/product_cart.dart';
import 'package:chill_market/features/cart/domain/usecase/add_product_cart.dart';
import 'package:chill_market/features/cart/domain/usecase/delete_product_cart.dart';
import 'package:chill_market/features/cart/domain/usecase/edit_count_product.dart';
import 'package:chill_market/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_event.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddProductCartUsecase addProductCart;
  final DeleteProductCartUsecase deleteProductCart;
  final EditCountProductUsecase editCountProduct;
  final GetCartUsecase getCartUsecase;
  CartBloc(
    this.addProductCart,
    this.deleteProductCart,
    this.editCountProduct,
    this.getCartUsecase,
  ) : super(CartInitial()) {
    on<GetCartEvent>(_onGetCart);
    on<AddProductEvent>(_onAdd);
    on<EditCountEvent>(_onEditCount);
    on<DeleteProductEvent>(_onDelete);
  }

  void _onGetCart(GetCartEvent event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());
      final List<ProductCart> cart = await getCartUsecase();
      emit(CartLoaded(cart: cart));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  void _onAdd(AddProductEvent event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());
      await addProductCart(event.productCart);
      final List<ProductCart> cart = await getCartUsecase();
      emit(CartLoaded(cart: cart));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  void _onEditCount(EditCountEvent event, Emitter<CartState> emit) async {
    try {
      if (event.work == 'inc') {
        final int count = event.productCart.count + 1;
        await editCountProduct(
          ProductCart(
            id: event.productCart.id,
            product: event.productCart.product,
            count: count,
          ),
        );
        final List<ProductCart> cart = await getCartUsecase();
        emit(CartLoaded(cart: cart));
      } else {
        final int count = event.productCart.count - 1;
        if (count == 0) {
          await deleteProductCart(event.productCart.id);
        } else {
          await editCountProduct(
            ProductCart(
              id: event.productCart.id,
              product: event.productCart.product,
              count: count,
            ),
          );
        }

        final List<ProductCart> cart = await getCartUsecase();
        emit(CartLoaded(cart: cart));
      }
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  void _onDelete(DeleteProductEvent event, Emitter<CartState> emit) async {
    try {
      emit(CartLoading());
      await deleteProductCart(event.id);
      final List<ProductCart> cart = await getCartUsecase();
      emit(CartLoaded(cart: cart));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }
}
