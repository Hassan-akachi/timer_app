import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/states/timer_state.dart';

import 'pause_button.dart';
import 'play_button.dart';

class DisplayWithButton extends StatelessWidget {
  final String displayString;
  final bool isRunning;
  final VoidCallback pausedfunc;
  final VoidCallback unpausefunc;

  const DisplayWithButton(
      {Key? key,
      required this.displayString,
      required this.isRunning,
      required this.pausedfunc,
      required this.unpausefunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                displayString,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: isRunning ==true
                        ? Colors.white
                        : Theme.of(context).primaryColorDark,
                    fontSize: 70),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: isRunning ==true
                  ? PauseButton(
                      onPressed: pausedfunc,
                      size: 100,
                    )
                  : PlayButton(
                      onPressed: unpausefunc,
                      size: 100,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
