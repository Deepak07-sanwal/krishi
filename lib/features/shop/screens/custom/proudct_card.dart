// ProductCard widget
import 'package:flutter/material.dart';
import 'package:krishi/features/shop/screens/products_details.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String quantity;
  final String price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductDetails()));
      },
      child: Card(
        color: Theme.of(context).colorScheme.onTertiary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(image, fit: BoxFit.fitWidth),
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
              child: Text(quantity,
                  style: Theme.of(context).textTheme.labelMedium),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(price,
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
