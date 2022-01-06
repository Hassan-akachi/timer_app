import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ResetButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        iconSize: 50,
        onPressed: onPressed,
        icon: Icon(Icons.restart_alt_outlined));
  }
}
