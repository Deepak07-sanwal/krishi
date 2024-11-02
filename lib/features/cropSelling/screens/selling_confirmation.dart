import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi/features/cropSelling/controllers/selling_controller.dart';

class SellingConfirmation extends StatelessWidget {
  final String? uid;
  const SellingConfirmation({super.key, this.uid});

  @override
  Widget build(BuildContext context) {
    final sellingController = Get.put(SellingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell Confirmation"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Theme.of(context).colorScheme.onTertiary,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Farmer Assistant",
                    style: Theme.of(context).textTheme.titleLarge!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person_rounded),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Jhon Deo\n",
                              style: Theme.of(context).textTheme.bodyLarge,
                              children: [
                            TextSpan(
                                text: "Nainital, Uttarakhand",
                                style: Theme.of(context).textTheme.labelMedium)
                          ])),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Theme.of(context).colorScheme.primary,
                          ))
                    ],
                  ),
                  Divider(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                  ),
                  Text(
                    "Sale data",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("Crop Name"),
                      const Spacer(),
                      Text(sellingController.cropName),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Quantity/ Weight"),
                      const Spacer(),
                      Text(sellingController.cropQuantity.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Per kg price"),
                      const Spacer(),
                      Text("Rs. ${sellingController.cropPrice}"),
                    ],
                  ),
                  Divider(
                    color:
                        Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                  ),
                  Row(
                    children: [
                      const Text("Payment Methods"),
                      const Spacer(),
                      const Text("Cash"),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Theme.of(context).colorScheme.primary,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Total Payment"),
                      const Spacer(),
                      Text(
                          "Rs. ${sellingController.cropQuantity * sellingController.cropPrice}"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.onSurface),
                            ),
                        child: Text(
                          "Cancel",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          sellingController.addValueToList(uid);
                          Get.back();
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                            ),
                        child: Text(
                          "Confirm",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
