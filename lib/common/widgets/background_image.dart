import 'package:flutter/material.dart';
import "dart:ui" as ui;

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return ui.Gradient.linear(
          Offset(0, bounds.height),
          Offset(bounds.width / 2, bounds.height / 2),
          [Colors.black87, Colors.black12],
        );
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/farmer.jpeg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        )),
      ),
    );
  }
}
