import 'package:flutter/material.dart';
import 'package:flutter_raspberry_pi_iot/app/const.dart';
import 'package:flutter_raspberry_pi_iot/service/gpio_output_service.dart';

class OutputControlButton extends StatefulWidget {
  const OutputControlButton(
      {super.key,
      required this.ledName,
      required this.boxColor,
      required this.gpio,
      required this.flexWidth,
      required this.flexHeight});

  final String ledName;
  final Color boxColor;
  final int gpio;
  final int flexWidth;
  final int flexHeight;

  @override
  State<OutputControlButton> createState() => _OutputControlButtonState();
}

class _OutputControlButtonState extends State<OutputControlButton> {
  bool _outputValue = false;
  late OutputService outputervice;

  @override
  void initState() {
    outputervice = OutputService(pinGpio: widget.gpio);

    super.initState();
  }

  @override
  void dispose() {
    outputervice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.sizeOf(context);
    double width = appSize.width / widget.flexWidth;
    double height = appSize.height / widget.flexHeight;
    Color ledStateColorButton = Colors.red.shade100;
    String ledState = 'Off';

    if (!_outputValue) {
      ledStateColorButton = Colors.red;
      ledState = 'Off';
    } else {
      ledStateColorButton = Colors.green;
      ledState = 'On ';
    }
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: widget.boxColor,
            border: Border.all(width: 2.0, color: Colors.white70),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(ledStateColorButton),
                ),
                onPressed: () {
                  setState(() {
                    _outputValue = !_outputValue;
                    outputervice.gpioOutputLevel(_outputValue);
                  });
                },
                child: Text(
                  '${widget.ledName}: $ledState',
                  style: styleText,
                )),
          ),
        ),
      ),
    );
  }
}
