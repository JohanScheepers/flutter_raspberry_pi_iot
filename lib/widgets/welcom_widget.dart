import 'package:flutter/material.dart';

class WelcomWidget extends StatelessWidget {
  const WelcomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 1.0),
        colors: <Color>[
          Color.fromARGB(255, 147, 240, 116),
          Color(0xffffb56b),
        ],
      ).createShader(bounds),
      child: const Text(
        'Start your Flutter IOT Projects',
        style: TextStyle(color: Colors.white, fontSize: 32),
      ),
    );
  }
}
