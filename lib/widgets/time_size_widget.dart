import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_raspberry_pi_iot/app/const.dart';

class TimeSizeWidget extends StatefulWidget {
  const TimeSizeWidget({
    super.key,
  });

  @override
  State<TimeSizeWidget> createState() => _TimeSizeWidgetState();
}

class _TimeSizeWidgetState extends State<TimeSizeWidget> {
  String timeVar = getTime();
  late Timer _timer;

  void _incrementCounter(Timer timer) {
    setState(() {
      timeVar = getTime();
    });
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), _incrementCounter);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        Size appSize = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Column(
          children: [
            Text("width: ${appSize.width}"),
            Text("height: ${appSize.height}"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              const Text('Time:'),
              Text(timeVar),
            ],
          ),
        )
      ],
    );
  }
}
