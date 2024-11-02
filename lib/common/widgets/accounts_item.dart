import 'package:flutter/material.dart';

class AccountsItem extends StatelessWidget {
  final String mainTitle;
  final String secondaryTitle;
  final IconData icon;
  const AccountsItem(
      {super.key,
      required this.mainTitle,
      required this.secondaryTitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 70,
      child: Card(
        color: Theme.of(context).colorScheme.onTertiary,
        child: TextButton.icon(
          style: ButtonStyle(
              alignment: Alignment.topLeft,
              minimumSize: MaterialStateProperty.all(Size.infinite)),
          onPressed: () {},
          icon: Icon(
            icon,
            size: 30,
          ),
          label: RichText(
              text: TextSpan(
                  text: mainTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                  children: [
                TextSpan(
                    text: secondaryTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12))
              ])),
        ),
      ),
    );
  }
}
