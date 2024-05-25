import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

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
              Image.asset(
                "assets/images/home-bg.png",
                width: double.infinity,
                height: 250,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Black Tea leaf",
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
                      "Available in stocks",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
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
                      const Text("Rs. 5/kg"),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_circle,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                          const Text("10"),
                          IconButton(
                              onPressed: () {},
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
              ReadMoreText(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat ",
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
        child:
            ElevatedButton(onPressed: () {}, child: const Text("Add to Cart")),
      ),
    );
  }
}
