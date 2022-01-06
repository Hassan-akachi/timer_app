import 'package:flutter/material.dart';

import 'nav_bar_inherted_widget.dart';


class NavBarState extends StatefulWidget {
  final Widget child;
  const NavBarState({Key? key, required this.child}) : super(key: key);

  static NavBarStateState? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<NavBarInhertedWidget>()?.data;
  }

  @override
  NavBarStateState createState() => NavBarStateState();
}

class NavBarStateState extends State<NavBarState> {
  int _index =0;
  int get index =>_index; //getter method
  void setIndex(index) {
    setState(() {
      _index =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return NavBarInhertedWidget(child: widget.child, data: this);
  }
}
