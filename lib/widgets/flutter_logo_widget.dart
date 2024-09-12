import 'package:flutter/material.dart';

class FlutterLogoWidget extends StatelessWidget {
  const FlutterLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: const Image(
          image: AssetImage('assets/images/dash.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
