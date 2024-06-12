import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/features/shop/controllers/cart_details_controller.dart';

class AddToCard extends StatefulWidget {
  const AddToCard({super.key});

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  List items = ["Red Orange", "Item2"];
  List itemsQuantity = [10, 20];
  List itemsPrice = [100, 200];

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
                              width: 90,
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
                                    Text(c.itemQuantity[index].toString()),
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
            onPressed: () {}, child: const Text("Proceed to buy")),
      ),
    );
  }
}
