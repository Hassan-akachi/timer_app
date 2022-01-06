import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:timer/methods/build_app_bar.dart';
import 'package:timer/states/timer_state.dart';
import 'package:timer/widgets/bottom_nav_bar.dart';
import 'package:timer/widgets/display_with_button.dart';
import 'package:timer/widgets/pause_button.dart';
import 'package:timer/widgets/play_button.dart';
import 'package:timer/widgets/reset_button.dart';

class TimerScreen extends StatelessWidget {
  static const String RouteName = "/Timer-screen"; // global variable
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerState state = Get.put(TimerState());
    return Scaffold(
        appBar: BuildAppBar(context: context, onPressed: state.reset),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Obx(() {
          if (state.isTimerFinished.value) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                state.displayString.value,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: state.isErrorShowed.value
                        ? Colors.white
                        : Theme.of(context).errorColor,
                    fontSize: 70),
              ),
            );
          } else if (!state.isStarted.value) {
            return Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        child: PlayButton(
                          onPressed: state.start,
                          size: 300,
                        ))),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: MediaQuery.of(context).size.width * .25,
                          child: TextField(
                            controller: state.startingMinutesInput.value,
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: Text(
                            ":",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .25,
                          margin: EdgeInsets.only(left: 7),
                          child: TextField(
                            controller: state.startingSecondsInput.value,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return DisplayWithButton(
                displayString: state.displayString.value,
                isRunning: state.isRunning.value,
                pausedfunc: state.pause,
                unpausefunc: state.unpause);
          }
        }),
        bottomNavigationBar: BottomNavBar());
  }
}
