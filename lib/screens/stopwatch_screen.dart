import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/methods/build_app_bar.dart';
import 'package:timer/states/stopwatch_provider.dart';
import 'package:timer/widgets/bottom_nav_bar.dart';
import 'package:timer/widgets/display_with_button.dart';
import 'package:timer/widgets/play_button.dart';
import 'package:timer/widgets/reset_button.dart';

class StopWatchScreen extends StatelessWidget {
  static const String RouteName = "/StopWatch-Screen"; // global variable
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Consumer<StopWatchProvider>(builder: (context, state, _) {
        return Scaffold(
          appBar: BuildAppBar(context: context, onPressed: state.reset),
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
          body: state.isStarted
              ? DisplayWithButton(
              displayString: state.elapsedTimeString,
              isRunning: state.isRunning,
              pausedfunc: state.pause,
              unpausefunc: state.unpause)
              : Center(
              child: PlayButton(
                onPressed: state.start,
                size: 300,
              )),
          bottomNavigationBar: BottomNavBar(),
        );
      }
    );
  }
}
