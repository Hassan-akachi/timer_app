import 'package:flutter/material.dart';
import 'package:timer/states/nav_bar_state.dart';

class NavBarInhertedWidget extends InheritedWidget {
  NavBarStateState data;

  NavBarInhertedWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
