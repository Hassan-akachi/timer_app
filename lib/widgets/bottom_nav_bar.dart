import 'package:flutter/material.dart';
import 'package:timer/screens/settings_screen.dart';
import 'package:timer/screens/stopwatch_screen.dart';
import 'package:timer/screens/timer_screen.dart';
import 'package:timer/states/nav_bar_state.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  @override
  void didChangeDependencies() {
  super.didChangeDependencies();
  NavBarStateState? data=NavBarState.of(context);
  index =data!.index;
  }

  @override
  Widget build(BuildContext context) {
    BottomNav(String title, IconData navIcon) {
      return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(navIcon),
        ),
        label: title,
      );
    }
// the callback method used to change the bottomNavBar


    return BottomNavigationBar(
      unselectedItemColor: Colors.white38,
      selectedItemColor: Colors.white,
      currentIndex: index,
      backgroundColor: Theme.of(context).backgroundColor,
      items: [
        BottomNav("StopWatch", Icons.timer),
        BottomNav("Timer", Icons.timelapse),
        BottomNav('Settings', Icons.settings)
      ],
      onTap: (ind) {
        NavBarState.of(context)?.setIndex(ind); //caller
        switch (ind) {
          case 0:
            Navigator.pushReplacementNamed(context, StopWatchScreen.RouteName);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, TimerScreen.RouteName);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, SettingsScreen.RouteName);
            break;
          default:
            Navigator.pushReplacementNamed(context, StopWatchScreen.RouteName);
            break;
        }
      },
    );
  }
}
