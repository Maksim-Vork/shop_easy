import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/bloc/product_list_bloc.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/bloc/product_list_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/bloc/product_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogHome extends StatefulWidget {
  const CatalogHome({super.key});

  @override
  State<CatalogHome> createState() => _CatalogHomeState();
}

class _CatalogHomeState extends State<CatalogHome> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductListBloc>(context).add(GetListProduct());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state is ProductListInitial || state is ProductListLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is ProductListLoaded) {
          return CatalogScreen(products: state.products);
        } else if (state is ProductListError) {
          return Scaffold(body: Center(child: Text(state.error)));
        } else {
          return Scaffold(
            body: Center(child: Text('Перезапустите приложение')),
          );
        }
      },
    );
  }
}

class CatalogScreen extends StatefulWidget {
  final List<Product> products;
  const CatalogScreen({super.key, required this.products});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late final PageController pageController;
  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: 1, viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.transparent,
            pinned: true,
            snap: true,
            floating: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Адрес',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.notifications, size: 30),
                ),
              ],
            ),
            backgroundColor: AppTheme.appBarColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(77),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(18),
                ),

                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 9),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hint: Text(
                            'Поиск товаров',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        cursorWidth: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 136,
              child: PageView.builder(
                controller: pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 124, 124, 124),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 17)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Категория',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
            sliver: SliverGrid.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 7,
                childAspectRatio: 3.73,
              ),
              itemBuilder: (context, index) {
                final List<String> kategory = [
                  'Одежда',
                  "Электронника",
                  "Обувь",
                  "Мебель",
                ];
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        kategory[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 21)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Популярное',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 14),
            sliver: SliverGrid.builder(
              itemCount: widget.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 7,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return Container(decoration: BoxDecoration(color: Colors.grey));
              },
            ),
          ),
        ],
      ),
    );
  }
}
