import 'package:flutter/material.dart';

class MainScreenCardTile extends StatelessWidget {
  final String primaryText1;
  final String primaryText2;
  final String secondaryText1;
  final String secondaryText2;
  const MainScreenCardTile(
      {super.key,
      required this.primaryText1,
      required this.primaryText2,
      required this.secondaryText1,
      required this.secondaryText2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
            text: TextSpan(
          text: "$primaryText1\n",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5)),
          children: [
            TextSpan(
              text: secondaryText1,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
          ],
        )),
        const Spacer(),
        RichText(
            text: TextSpan(
          text: "$primaryText2\n",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5)),
          children: [
            TextSpan(
              text: secondaryText2,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
          ],
        )),
      ],
    );
  }
}
