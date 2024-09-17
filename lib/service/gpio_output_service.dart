import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dart_periphery/dart_periphery.dart';

class OutputService {
  final int pinGpio;
  GPIO? _gpio;
  Timer? _flashTimer;

  OutputService({
    required this.pinGpio,
  }) {
    _gpio = GPIO(pinGpio, GPIOdirection.gpioDirOut);
  }
  void gpioOutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    _gpio?.write(outputValue);
    
  }

  void flashLed(bool start,  timeOn, int timeOff) {
    if (start) {
      _flashTimer = Timer.periodic(
          Duration(milliseconds: timeOn + timeOff), (timer) {
        gpioOutputLevel(true);
        Future.delayed(Duration(milliseconds: timeOn), () {
          gpioOutputLevel(false);
        });
      });
    } else {
      // If flashing is to be stopped, cancel the timer
      _flashTimer?.cancel();
      gpioOutputLevel(false);
    }
  }

  void dispose() {
    _gpio?.dispose();
  }
}
