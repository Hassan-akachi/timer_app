import 'package:flutter/material.dart';

class PauseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  const PauseButton({Key? key, required this.onPressed, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.pause_circle_outlined),
      iconSize: size,
      color: Theme.of(context).primaryColor,
    );
  }
}
