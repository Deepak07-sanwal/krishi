import 'package:flutter/material.dart';
import 'package:krishi/features/shop/controllers/products_controller.dart';
import 'package:krishi/features/shop/models/products_model.dart';
import 'package:krishi/features/shop/screens/custom/proudct_card.dart';

class SeedsProducts extends StatefulWidget {
  const SeedsProducts({super.key});

  @override
  State<SeedsProducts> createState() => _SeedsProductsState();
}

class _SeedsProductsState extends State<SeedsProducts> {
  late Future<List<ProductsModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductsController().getAllSeedsData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductsModel>>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<ProductsModel> products = snapshot.data!;
          return Expanded(
            child: GridView.count(
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              childAspectRatio: (1 / 1.6),
              children: products.map((product) {
                return ProductCard(
                  image: product.imageUrl,
                  name: product.itemName,
                  quantity: product.itemQuantity,
                  price: product.itemPrice,
                  description: product.description,
                  productId: product.productId,
                );
              }).toList(),
            ),
          );
        } else {
          return const Center(child: Text('No products found'));
        }
      },
    );
  }
}
