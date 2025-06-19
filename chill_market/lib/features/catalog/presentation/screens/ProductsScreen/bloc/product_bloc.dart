import 'package:chill_market/core/Service/LocatorService/get_it.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/usecase/get_product_by_id.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/bloc/product_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductById getProductById = getIt<GetProductById>();
  ProductBloc() : super(ProductInitial()) {
    on<GetProductByIdEvent>(_onGetById);
  }

  void _onGetById(GetProductByIdEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());

      final Product product = await getProductById(event.id);
      emit(ProductLoaded(product: product));
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }
}
