import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/screens/settings_screen.dart';
import 'package:timer/screens/stopwatch_screen.dart';
import 'package:timer/screens/timer_screen.dart';
import 'package:timer/states/nav_bar_state.dart';
import 'package:timer/states/stopwatch_provider.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarState(
      child: ChangeNotifierProvider(    //creating this here will make the provider always send info to the page without stopping even after navigating away
        create: (context) => StopWatchProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: Colors.black,
            primaryColor: Colors.lime,
            primaryColorDark: Colors.white38,
            errorColor: Color.fromRGBO(110, 0, 51, 1),
            textTheme: const TextTheme(
                headline1: TextStyle(
                  //setting different themes
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: Colors.white,
                ),
                headline2: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
          routes: {
            StopWatchScreen.RouteName: (context) => StopWatchScreen(),
            TimerScreen.RouteName: (context) => TimerScreen(),
            SettingsScreen.RouteName: (context) => SettingsScreen()
          },
          home: StopWatchScreen(),
        ),
      ),
    );
  }
}
