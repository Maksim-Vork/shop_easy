import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/cart/presentation/cart_screen.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductCategoryScreen/product_category_screen.dart';
import 'package:chill_market/features/catalog/presentation/screens/ProductListScreen/catalog_screen.dart';
import 'package:chill_market/features/profile/presentation/settings_screen.dart';

import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CatalogHome(),
    ProductCategoryScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          backgroundColor: AppTheme.appBarColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppTheme.bottomBarColor,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Каталог'),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Категории',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}
