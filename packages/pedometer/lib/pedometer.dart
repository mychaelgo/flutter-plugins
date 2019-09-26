import 'dart:async';

import 'package:flutter/services.dart';

class Pedometer {
  static const EventChannel _eventChannel =
      const EventChannel("pedometer.eventChannel");

  static const MethodChannel _methodChannel =
      MethodChannel('pedometer.querySteps');

  /// The pedometer stream will continuously return the cumulative number of
  /// steps taken since the application was started.
  /// A step count is an [int] value.
  Stream<int> _pedometerStream;

  Stream<int> get pedometerStream {
    if (_pedometerStream == null) {
      _pedometerStream =
          _eventChannel.receiveBroadcastStream().map((stepCount) => stepCount);
    }
    return _pedometerStream;
  }

  Future<int> querySteps(
    String from,
    String to,
  ) async {
    try {
      final int steps = await _methodChannel.invokeMethod(
        'querySteps',
        <String, String>{
          'from': from,
          'to': to,
        },
      );
      return steps;
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
      return -1;
    }
  }
}
