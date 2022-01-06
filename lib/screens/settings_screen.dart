import 'package:flutter/material.dart';
import 'package:timer/widgets/bottom_nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  static const String RouteName="/Setting-Screen"; //global variable
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Text(
            'SETTING SCREEN',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        bottomNavigationBar: BottomNavBar());
  }
}
