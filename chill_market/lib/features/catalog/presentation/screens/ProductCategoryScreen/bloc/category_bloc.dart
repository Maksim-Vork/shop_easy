import 'package:chill_market/core/Service/LocatorService/get_it.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/domain/usecase/get_list_products_by_slug.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final getListProductsBySlug = getIt<GetListProductsBySlug>();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategorySearchBySlug>(_onSearchCaategory);
  }

  void _onSearchCaategory(
    CategorySearchBySlug event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(CategoryLoading());

      final List<Product> products = await getListProductsBySlug(event.slug);
      emit(CategoryLoaded(productsSort: products));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }
}
