import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const AppElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  factory AppElevatedButton.print(VoidCallback? onPressed) => AppElevatedButton(
        text: "Print",
        onPressed: onPressed,
      );

  factory AppElevatedButton.printImage(VoidCallback? onPressed) => AppElevatedButton(
        text: "Print Image",
        onPressed: onPressed,
      );

  factory AppElevatedButton.findPrinters(VoidCallback? onPressed) => AppElevatedButton(
        text: "Find printers",
        onPressed: onPressed,
      );

  factory AppElevatedButton.connect(VoidCallback? onPressed) => AppElevatedButton(
        text: "Connect",
        onPressed: onPressed,
      );

  factory AppElevatedButton.disconnect(VoidCallback? onPressed) => AppElevatedButton(
        text: "Disconnect",
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      );
}
