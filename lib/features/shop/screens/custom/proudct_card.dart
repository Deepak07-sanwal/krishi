// ProductCard widget
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:krishi/features/shop/screens/products_details.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final int quantity;
  final int price;
  final String description;
  final String productId;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(
                      image: image,
                      name: name,
                      quantity: quantity,
                      price: price,
                      description: description,
                    )));
      },
      child: Card(
        color: Theme.of(context).colorScheme.onTertiary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Image(
                height: 120,
                width: 200,
                image: imageProvider,
                fit: BoxFit.fitWidth,
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/fertilizer.png",
                height: 150,
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            // Image.asset(image, fit: BoxFit.fitWidth),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(quantity.toString(),
                  style: Theme.of(context).textTheme.labelMedium),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text("Rs. $price",
                      style: const TextStyle(fontSize: 14, color: Colors.red)),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "+",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
