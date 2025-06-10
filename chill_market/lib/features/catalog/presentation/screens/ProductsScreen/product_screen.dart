import 'package:chill_market/core/Service/ThemeService/app_theme.dart';
import 'package:chill_market/features/catalog/domain/entity/product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PageController _imageController = PageController();
  void tap() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.appBarColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 23, vertical: 14),
          child: Column(
            children: [
              SizedBox(
                height: 338,
                child: PageView.builder(
                  controller: _imageController,
                  itemCount: widget.product.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    final List<String> imageList = widget.product.images;
                    return SizedBox(
                      width: double.infinity,
                      height: 169,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          imageList[index],
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
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
                    '${widget.product.price.toString()}\$',
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text(
                widget.product.title,
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
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(widget.product.category.name),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                widget.product.description,
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
          onPressed: () {},
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
  }
}
