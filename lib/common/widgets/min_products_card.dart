import 'package:flutter/material.dart';

class MiniProductCart extends StatelessWidget {
  const MiniProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Flexible(
            child: Image.asset(
              'assets/images/home-bg.png',
            ),
          ),
          const Text("Wheat"),
        ],
      ),
    );
  }
}
