import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/cart/domain/entity/product.dart';
import 'package:chill_market/features/cart/domain/entity/product_cart.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/bloc/product_bloc.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/bloc/product_event.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  final int id;

  const ProductScreen({super.key, required this.id});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PageController _imageController = PageController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(
      context,
    ).add(GetProductByIdEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return Scaffold(
            appBar: AppBar(backgroundColor: AppTheme.appBarColor),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 23,
                  vertical: 14,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 338,
                      child: PageView.builder(
                        controller: _imageController,
                        itemCount: state.product.images.length,
                        itemBuilder: (BuildContext context, int index) {
                          final List<String> imageList = state.product.images;
                          return SizedBox(
                            width: double.infinity,
                            height: 169,

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.network(
                                imageList[index],
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, __, ___) => const Icon(Icons.error),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.priceColor,
                          ),
                          '${state.product.price.toString()}\$',
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Text(
                      state.product.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          // height: 28,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(state.product.category.name),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      state.product.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            bottomNavigationBar: Container(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  BlocProvider.of<CartBloc>(context).add(
                    AddProductEvent(
                      productCart: ProductCart(
                        id: state.product.id,
                        product: ProductC(
                          id: state.product.id,
                          title: state.product.title,
                          price: state.product.price,
                          description: state.product.description,
                          images: state.product.images.first,
                        ),
                        count: 1,
                      ),
                    ),
                  );
                },
                child: Text(
                  'В корзину',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        } else if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductError) {
          return Center(child: Text(state.error));
        } else {
          return Center(child: Text('Перезагрузите приложение'));
        }
      },
    );
  }
}
