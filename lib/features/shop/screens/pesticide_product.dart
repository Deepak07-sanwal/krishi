import 'package:flutter/material.dart';
import 'package:krishi/features/shop/screens/custom/proudct_card.dart';

class PesticideProducts extends StatelessWidget {
  const PesticideProducts({super.key});

  @override
  Widget build(BuildContext context) {
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
        children: const <Widget>[
          Text("Pesticide"),
          ProductCard(
            image: "assets/images/fertilizer.png",
            name: "NPK Fertilizer",
            quantity: "1 Kg",
            price: "Rs. 100",
          ),
          ProductCard(
            image: "assets/images/fertilizer.png",
            name: "NPK Fertilizer",
            quantity: "1 Kg",
            price: "Rs. 100",
          ),
          ProductCard(
            image: "assets/images/fertilizer.png",
            name: "NPK Fertilizer",
            quantity: "1 Kg",
            price: "Rs. 100",
          ),
          ProductCard(
            image: "assets/images/fertilizer.png",
            name: "NPK Fertilizer",
            quantity: "1 Kg",
            price: "Rs. 100",
          ),
          ProductCard(
            image: "assets/images/fertilizer.png",
            name: "NPK Fertilizer",
            quantity: "1 Kg",
            price: "Rs. 100",
          ),
          ProductCard(
            image: "assets/images/fertilizer.png",
            name: "NPK Fertilizer",
            quantity: "1 Kg",
            price: "Rs. 100",
          ),
        ],
      ),
    );
  }
}
