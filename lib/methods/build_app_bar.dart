import 'package:flutter/material.dart';
import 'package:timer/widgets/reset_button.dart';


 AppBar BuildAppBar({required BuildContext context,required VoidCallback onPressed}){
  return AppBar(
    backgroundColor: Colors.black,
    actions: [ResetButton(onPressed: onPressed)],
  );
}