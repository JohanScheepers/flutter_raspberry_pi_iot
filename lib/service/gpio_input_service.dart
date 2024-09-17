import 'dart:async';

import 'package:dart_periphery/dart_periphery.dart';

class InputService {
  final int gpioPin;
  final Duration pollInterval;
  final Duration debounceInterval;
  final StreamController<bool> _inputStateController =
      StreamController<bool>.broadcast();
  bool _isPolling = false;
  GPIO? _gpio;

  InputService({
    required this.gpioPin,
    this.pollInterval = const Duration(milliseconds: 200),
    this.debounceInterval = const Duration(milliseconds: 50),
  }) {
    _gpio = GPIO(gpioPin, GPIOdirection.gpioDirIn);
  }

  Stream<bool> get inputStateStream => _inputStateController.stream;

  void startPolling() {
    if (_isPolling) return;

    _isPolling = true;
    Timer.periodic(pollInterval, (timer) async {
      if (!_isPolling) {
        timer.cancel();
        return;
      }
      bool initialGpoiRead = _gpio!.read();
      await Future.delayed(debounceInterval);
      bool secondGpioRead = _gpio!.read();

      if (initialGpoiRead == secondGpioRead) {
        _inputStateController.add(initialGpoiRead);
      }
    });
  }

  void stopPolling() {
    _isPolling = false;
  }

  void dispose() {
    _isPolling = false;
    _inputStateController.close();
    _gpio?.dispose();
  }
}
