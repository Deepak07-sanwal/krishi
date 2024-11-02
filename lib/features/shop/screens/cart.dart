import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/features/dashboard/dashboard.dart';
import 'package:krishi/features/shop/controllers/cart_details_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String uid = "";
  @override
  void initState() {
    super.initState();
    _loadUid();
  }

  Future<void> _loadUid() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    CartDetailsController c = Get.put(CartDetailsController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Cart",
        ),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
      ),
      body: Obx(
        () => c.cardItem.isNotEmpty &&
                c.itemQuantity.isNotEmpty &&
                c.itemPrice.isNotEmpty
            ? ListView.builder(
                itemCount: c.cardItem.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Theme.of(context).colorScheme.onTertiary,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/fertilizer.png",
                              width: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RichText(
                                  text: TextSpan(
                                      text: "${c.cardItem[index]}\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                      children: [
                                    TextSpan(
                                      text:
                                          "Rs. ${(c.itemPrice[index] * c.itemQuantity[index]).toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    )
                                  ])),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      c.deleteItem(index);
                                    },
                                    icon: const Icon(Icons.delete)),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          c.itemQuantity[index] -= 1;
                                        },
                                        icon: Icon(
                                          Icons.remove_circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                    Text(
                                      c.itemQuantity[index].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          c.itemQuantity[index] += 1;
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text("Your cart is empty, please add products"),
              ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
            onPressed: () {
              c.addProductsToFirebase(uid: uid);
              c.deleteAllItems();
              Get.off(() => const Dashboard());
            },
            child: const Text("Proceed to buy")),
      ),
    );
  }
}
