import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/features/shop/screens/cart.dart';
import 'package:krishi/features/shop/screens/fertilizer_product.dart';
import 'package:krishi/features/shop/screens/pesticide_product.dart';

import 'package:krishi/features/shop/screens/seeds_product.dart'; // Adjust the import according to your file structure

class BuyingPage extends StatefulWidget {
  const BuyingPage({super.key});

  @override
  State<BuyingPage> createState() => _BuyingPageState();
}

class _BuyingPageState extends State<BuyingPage> {
  final categories = ["Seeds", "Fertilizer", "Pesticide"];
  final products = [
    const SeedsProducts(),
    const FertilizerProducts(),
    const PesticideProducts(),
  ];
  int productIndex = 0;

  String selectedCategory = "Seeds";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Buy Material"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const Cart());
            },
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).iconTheme.color,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                label: Text(
                  "Search a product",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                hintText: "Fertilizer",
                hintStyle: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = categories[index];
                        productIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4),
                      decoration: BoxDecoration(
                          color: selectedCategory == categories[index]
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: selectedCategory == categories[index]
                              ? Colors.white
                              : Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            products[productIndex],
          ],
        ),
      ),
    );
  }
}
