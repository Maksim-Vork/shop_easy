import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/usecase/get_list_product.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/bloc/product_list_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/bloc/product_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetListProductUsecase getListProductUsecase;
  ProductListBloc(this.getListProductUsecase) : super(ProductListInitial()) {
    on<GetListProduct>(_onGet);
  }

  void _onGet(GetListProduct event, Emitter<ProductListState> emit) async {
    try {
      emit(ProductListLoading());

      final List<Product> listProducts = await getListProductUsecase();
      emit(ProductListLoaded(products: listProducts));
    } catch (e) {
      emit(ProductListError(error: e.toString()));
    }
  }
}
