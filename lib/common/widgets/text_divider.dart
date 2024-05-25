import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // Adjust padding as needed
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.background,
              thickness: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context)
                      .colorScheme
                      .background), // Adjust font size as needed
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.background,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage:
// CustomWidget(text: "Your Text Here"),
