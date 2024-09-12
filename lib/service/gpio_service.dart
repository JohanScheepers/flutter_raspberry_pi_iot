import 'package:flutter/material.dart';
import 'package:dart_periphery/dart_periphery.dart';

class LedService {
  dynamic gpio22;
  dynamic gpio23;
  dynamic gpio24;
  dynamic gpio25;
  dynamic gpio26;
  dynamic gpio27;


  void initGpioOutput() {
    try {
      gpio22 = GPIO(22, GPIOdirection.gpioDirOut);
      gpio23 = GPIO(23, GPIOdirection.gpioDirOut);
      gpio24 = GPIO(24, GPIOdirection.gpioDirOut);
      gpio25 = GPIO(25, GPIOdirection.gpioDirOut);
      gpio26 = GPIO(26, GPIOdirection.gpioDirOut);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

//22
  void gpio22OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio22.write(outputValue);
  }

  //23
  void gpio23OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio23.write(outputValue);
  }

  //24
  void gpio24OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio24.write(outputValue);
  }

  //25
  void gpio25OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio25.write(outputValue);
  }

  //26
  void gpio26OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio26.write(outputValue);
  }


  void disposeGpio() {
    gpio22.dispose();
    gpio23.dispose();
    gpio24.dispose();
    gpio25.dispose();
    gpio26.dispose();
  }
}
