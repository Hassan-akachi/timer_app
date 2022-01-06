import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchProvider with ChangeNotifier {
  Stopwatch _sw = Stopwatch();
  String _returnString = "00:00";
  bool _isStarted = false;
  late Timer t;

  String get time => _returnString;

  bool get isRunning => _sw.isRunning;

  bool get isStarted => _isStarted;

  String get elapsedTimeString => _returnString;

  void start() {
    _sw.start();
    updateSwString();
    _isStarted = true;
    notifyListeners();
  }

  void reset() {
    _sw.stop();
    _sw.reset();
    t.cancel();
    _isStarted =false;
    _returnString="00:00";
    notifyListeners();
  }

  void pause() {
    _sw.stop();
    t.cancel();
    notifyListeners();
  }

  void unpause() {
    if (!_sw.isRunning) {
      print("unpaused");
      _sw.start();
      updateSwString();
      notifyListeners();
    }
  }

  //iterates through by a second and set the _returnString everyTime
  void updateSwString() {
   t= Timer.periodic(Duration(seconds: 1), (Timer t) {
      _returnString = _buidReturnString();
      print(_returnString);
      notifyListeners();
    });
  }

  String _buidReturnString() {
    String str = "";

    String buildReturnSeconds() {
      return (_sw.elapsed.inSeconds % 60) > 9
          ? "${_sw.elapsed.inSeconds % 60}"
          : "0${_sw.elapsed.inSeconds % 60}";
    }

    String buildReturnMinutes() {
      return (_sw.elapsed.inMinutes % 60) > 9
          ? "${_sw.elapsed.inMinutes}:${buildReturnSeconds()}"
          : "0${_sw.elapsed.inMinutes}:${buildReturnSeconds()}";
    }

    if (_sw.elapsed.inHours >= 1) {
      str += "${_sw.elapsed.inHours < 10 ? 0 : ""}${_sw.elapsed.inHours}";
    }
    str += buildReturnMinutes();
    return str;
  }
}
