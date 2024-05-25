import 'package:flutter/material.dart';

class RecommedationCard extends StatelessWidget {
  const RecommedationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onTertiary,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset("assets/images/farmer.jpeg"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Row(
                    children: [
                      Icon(Icons.energy_savings_leaf),
                      Text("Nutrient"),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  "Jun 16, 2024",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Top 6 Fertilizer to Grow Your Corn Optimally in The Lowlands",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
