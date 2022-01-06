import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerState extends GetxController {
  Stopwatch _tr = Stopwatch();
  final player = AudioCache();

  var displayString = "25.00".obs;
  var isRunning = false.obs;
  var isStarted = false.obs;
  var isTimerFinished = false.obs;
  RxBool isErrorShowed = RxBool(true);
  var startingSecondsInput = TextEditingController().obs..value.text = "00";
  var startingMinutesInput = TextEditingController().obs..value.text = "25";

  late Timer t, tfinished;

  void start() {
    if (!_tr.isRunning) {
      _tr.start();
      displayString.value = buildReturnString();
      updateString();
      isRunning.value = true;
      isStarted.value = true;
      isTimerFinished.value = false;
    }
  }

  void pause() {
    if (_tr.isRunning) {
      _tr.stop();
      t.cancel();
      isRunning.value = false;
    }
  }

  void unpause() {
    if (!_tr.isRunning) {
      _tr.start();
      updateString();
      isRunning.value = true;
    }
  }

  void reset() {
    _tr.stop();
    _tr.reset();
    t.cancel();
    isStarted.value = false;
    isRunning.value = false;
    isTimerFinished.value = false;
    dispose();
  }

  void updateString() {
    t = Timer.periodic(Duration(seconds: 1), (t) {
      displayString.value = buildReturnString();
      print(displayString.value);
    });
  }

  String buildReturnString() {
    String str = "";
    int startingMin = int.parse(startingMinutesInput.value.text);
    int startingSec = int.parse(startingSecondsInput.value.text);
    if (_tr.elapsed.inMinutes >= startingMin &&
        _tr.elapsed.inSeconds >= startingSec) {
      timeFinished();
      str = "00:00";
    } else {
      if ((startingSec - _tr.elapsed.inSeconds % 60) < 0) {
        str +=
            "${(startingMin - _tr.elapsed.inMinutes - 1).toString().padLeft(2, "0")}:";
      } else {
        str +=
            "${(startingMin - _tr.elapsed.inMinutes).toString().padLeft(2, "0")}:";
      }

      str +=
          "${((startingSec - _tr.elapsed.inSeconds) % 60).toString().padLeft(2, "0")}";
    }

    return str;
  }

  void timeFinished() {
    t.cancel();
    int i = 0;
    isTimerFinished.value = true;
    tfinished = Timer.periodic(Duration(milliseconds: 500), (tfinished) {
      isErrorShowed.value = !isErrorShowed.value;
      if (i % 2 == 0) {
        player.play("assets/alarm2.wav",volume: 0.5);
      }
      i++;
    });
    player.clearCache();
  }

  void disposed() {
    t.cancel();
    tfinished.cancel();
    startingSecondsInput.value.dispose();
    startingMinutesInput.value.dispose();
    //isRunning = false.obs;
  }
}
