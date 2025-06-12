import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_bloc.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/bloc/category_state.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            Text(
              'Категории',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 45),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 28)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),

            sliver: SliverGrid.builder(
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 14,
                childAspectRatio: 1.47,
              ),
              itemBuilder: (context, index) {
                final Map<String, String> categoryProducts = {
                  'Одежда': 'clothes',
                  'Электронника': 'electronics',
                  'Мебель': 'furniture',
                  'Обувь': 'shoes',
                  'Разнообразный': 'miscellaneous',
                };
                final List<String> categoryName =
                    categoryProducts.keys.toList();
                final List<String> categorySlug =
                    categoryProducts.values.toList();
                return InkWell(
                  onTap: () {
                    BlocProvider.of<CategoryBloc>(
                      context,
                    ).add(CategorySearchBySlug(slug: categorySlug[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                categoryName[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 23)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Отсортированные',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Выберите категорию',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is CategoryLoading) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is CategoryLoaded) {
                return SliverPadding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 14,
                    vertical: 9,
                  ),
                  sliver: SliverGrid.builder(
                    itemCount: state.productsSort.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 7,
                      childAspectRatio: 0.67,
                    ),
                    itemBuilder: (context, index) {
                      final List<Product> products = state.productsSort;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      ProductScreen(product: products[index]),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 169,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.network(
                                    products[index].images.first,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (_, __, ___) => const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    products[index].title.length > 20
                                        ? "${products[index].title.substring(0, 16)}.."
                                        : products[index].title,
                                  ),
                                  Text(
                                    style: TextStyle(
                                      color: AppTheme.priceColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    products[index].price.toString().length > 5
                                        ? "${products[index].price.toString().substring(0, 5)}.."
                                        : '${products[index].price}\$',
                                  ),
                                ],
                              ),
                              Text(
                                products[index].description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 7),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('Заказать'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is CategoryError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.error)),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Перезапустите приложение')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
