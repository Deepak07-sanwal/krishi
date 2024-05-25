import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:krishi/features/dashboard/screens/custom/main_screen_card_tile.dart';
import 'package:krishi/features/dashboard/screens/custom/recommedation_card.dart';
import 'package:krishi/features/shop/screens/add_to_cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Krishi"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddToCard()));
            },
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).iconTheme.color,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shadowColor: Colors.black,
                  color: Theme.of(context).colorScheme.onTertiary,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Hello User",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        const MainScreenCardTile(
                            primaryText1: "Days after seeding",
                            primaryText2: "26 days",
                            secondaryText1: "Elevation",
                            secondaryText2: "Vegetative"),
                        const SizedBox(
                          height: 10,
                        ),
                        const MainScreenCardTile(
                            primaryText1: "Season",
                            primaryText2: "Dry",
                            secondaryText1: "Phase",
                            secondaryText2: "245mdl")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Recommedation",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
                const RecommedationCard(),
                const SizedBox(
                  height: 20,
                ),
                const RecommedationCard(),
                const SizedBox(
                  height: 20,
                ),
                const RecommedationCard(),
                const SizedBox(
                  height: 20,
                ),
                const RecommedationCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
