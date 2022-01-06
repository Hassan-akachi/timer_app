import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;
  const PlayButton({Key? key, required this.onPressed, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        Icons.play_circle_outlined,
        size: size,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
