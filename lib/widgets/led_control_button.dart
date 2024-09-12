import 'package:flutter/material.dart';

class LedControlButton extends StatefulWidget {
  const LedControlButton(
      {super.key,
      required this.ledName,
      required this.boxColor,
      required this.onPressed,
      required this.ledStatus});

  final String ledName;
  final Color boxColor;
  final VoidCallback? onPressed;
  final bool ledStatus;

  @override
  State<LedControlButton> createState() => _LedControlButtonState();
}

class _LedControlButtonState extends State<LedControlButton> {
  @override
  Widget build(BuildContext context) {
    Color ledStateColorText = Colors.red;
    Color ledStateColorButton = Colors.red.shade100;
    String ledState = 'Off';

    if (!widget.ledStatus) {
      ledStateColorText = Colors.red;
      ledStateColorButton = Colors.red;
      ledState = 'Off';
    } else {
      ledStateColorText = Colors.green;
      ledStateColorButton = Colors.green;
      ledState = 'On ';
    }
    return Padding(
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
              onPressed: widget.onPressed,
              child: Text(
                '${widget.ledName}: $ledState',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w900),
              )),
        ),
      ),
    );
  }
}
