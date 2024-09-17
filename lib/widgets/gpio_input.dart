import 'package:flutter/material.dart';
import 'package:flutter_raspberry_pi_iot/app/const.dart';
import 'package:flutter_raspberry_pi_iot/service/gpio_input_service.dart';

class GpioInput extends StatefulWidget {
  const GpioInput(
      {super.key,
      required this.gpio,
      required this.flexWidth,
      required this.flexHeight});

  final int gpio;
  final int flexWidth;
  final int flexHeight;

  @override
  State<GpioInput> createState() => _GpioInputState();
}

class _GpioInputState extends State<GpioInput> {
  late InputService _inputService;
  late Stream<bool> _inputStateStream;

  @override
  void initState() {
    _inputService =
        InputService(gpioPin: widget.gpio); // specify your GPIO pin here
    _inputStateStream = _inputService.inputStateStream;
    _inputService.startPolling();
    super.initState();
  }

  @override
  void dispose() {
    _inputService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.sizeOf(context);
    double width = appSize.width / widget.flexWidth;
    double height = appSize.height / widget.flexHeight;
    return StreamBuilder<bool>(
        stream: _inputStateStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                  width: width,
                  height: height,
                  child: const CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: SizedBox(
                  width: width,
                  height: height,
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: styleText,
                  )),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                  width: width,
                  height: height,
                  child: const Text(
                    'No Data',
                    style: styleText,
                  )),
            );
          } else {
            bool inputState = snapshot.data!;
            Color switcStateColor = Colors.red;

            if (inputState) {
              switcStateColor = Colors.green;
            } else {
              switcStateColor = Colors.red;
            }
            return SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    border: Border.all(width: 2.0, color: Colors.white70),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: switcStateColor,
                        border: Border.all(width: 2.0, color: Colors.white70),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          'GPIO ${widget.gpio} Input State: $inputState',
                          style: styleText,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
