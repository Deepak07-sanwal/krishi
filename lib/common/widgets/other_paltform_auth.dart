import 'package:flutter/material.dart';

class OtherPlatformAuth extends StatelessWidget {
  const OtherPlatformAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          icon: Image.asset(
            'assets/logos/google-logo.png',
            height: 30,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          icon: Image.asset(
            'assets/logos/facebook-logo.png',
            height: 30,
          ),
        ),
        const Spacer(),
        IconButton(
          iconSize: 30,
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          icon: Image.asset(
            'assets/logos/microsoft-logo.png',
            scale: 90,
            height: 30,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          icon: Image.asset(
            'assets/logos/apple-logo.png',
            scale: 40,
            height: 30,
            width: 30,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
