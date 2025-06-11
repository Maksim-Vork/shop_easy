import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategorySearchBySlug>((event, emit) {});
  }
}
