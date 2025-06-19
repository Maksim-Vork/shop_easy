import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_event.dart';
import 'package:chill_market/features/cart/presentation/bloc/cart_state.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductsScreen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: Center(
          child: Text(
            'Корзина',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            if (state.cart.isEmpty) {
              return Center(child: Text('Корзина пуста'));
            } else {
              return ListView.builder(
                itemCount: state.cart.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ProductScreen(id: state.cart[index].id),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 18),
                      height: 123,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 123,
                            width: 123,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.network(
                                state.cart[index].product.images,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 174,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      state
                                                                  .cart[index]
                                                                  .product
                                                                  .title
                                                                  .length >
                                                              20
                                                          ? "${state.cart[index].product.title.substring(0, 16)}.."
                                                          : state
                                                              .cart[index]
                                                              .product
                                                              .title,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              children: [
                                                Text(
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        Theme.of(
                                                          context,
                                                        ).colorScheme.onSurface,
                                                  ),
                                                  maxLines: 1,
                                                  state
                                                              .cart[index]
                                                              .product
                                                              .description
                                                              .length >
                                                          25
                                                      ? "${state.cart[index].product.description.substring(0, 24)}.."
                                                      : state
                                                          .cart[index]
                                                          .product
                                                          .description,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  style: TextStyle(
                                                    color: AppTheme.priceColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  '${state.cart[index].product.price * state.cart[index].count}\$',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              BlocProvider.of<CartBloc>(
                                                context,
                                              ).add(
                                                EditCountEvent(
                                                  productCart:
                                                      state.cart[index],
                                                  work: 'inc',
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 23,
                                              height: 23,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Color(0xFF777777),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            state.cart[index].count.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              BlocProvider.of<CartBloc>(
                                                context,
                                              ).add(
                                                EditCountEvent(
                                                  productCart:
                                                      state.cart[index],
                                                  work: 'dic',
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 23,
                                              height: 23,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Color(0xFF777777),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: SizedBox(
                                        width: 100,
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            'Заказать',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is CartInitial) {
            return Center(child: Text('Перезагрузите приложение'));
          } else if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: Text('Перезагрузите приложение'));
          }
        },
      ),
    );
  }
}
