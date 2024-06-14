import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:krishi/features/shop/controllers/cart_details_controller.dart';
import 'package:krishi/features/shop/screens/add_to_cart.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String name;
  final int quantity;
  final int price;
  final String description;
  const ProductDetails({
    super.key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int tempQuantity = 1;
  String stock = "Available in stocks";
  String stockColor = "primary";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Krishi"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).iconTheme.color,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.image,
                imageBuilder: (context, imageProvider) => Image(
                  width: 500,
                  image: imageProvider,
                  fit: BoxFit.fitWidth,
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/home-bg.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(children: [
                    Text(
                      stock,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: stockColor == "primary"
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.error),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 213, 0),
                      ),
                      label: Text("4.9 (192)",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary)),
                    )
                  ]),
                  const Spacer(),
                  Column(
                    children: [
                      Text("Rs. ${widget.price}"),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (tempQuantity > 1) {
                                  setState(() {
                                    tempQuantity--;
                                  });
                                  if (tempQuantity <= widget.quantity) {
                                    setState(() {
                                      stock = "Available in stocks";
                                      stockColor = "primary";
                                    });
                                  } else {
                                    setState(() {
                                      stock = "Out of stock";
                                      stockColor = "error";
                                    });
                                  }
                                }
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                          Text("$tempQuantity"),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  tempQuantity++;
                                });
                                if (tempQuantity > widget.quantity) {
                                  setState(() {
                                    stock = "Out of stock";
                                    stockColor = "error";
                                  });
                                } else {
                                  setState(() {
                                    stock = "Available in stocks";
                                    stockColor = "primary";
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Theme.of(context).colorScheme.primary,
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Text("Description",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).colorScheme.tertiary)),
              ReadMoreText(widget.description,
                  trimLines: 2,
                  colorClickableText: Theme.of(context).colorScheme.primary,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
            onPressed: () {
              final carddetailscontroller = Get.put(CartDetailsController());
              carddetailscontroller.cardItem.add(widget.name);
              carddetailscontroller.itemQuantity.add(tempQuantity);
              carddetailscontroller.itemPrice.add(widget.price);
              Get.to(const AddToCard());
            },
            child: const Text("Add to Cart")),
      ),
    );
  }
}
