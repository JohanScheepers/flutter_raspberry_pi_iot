import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const AppRun());
}

class AppRun extends StatelessWidget {
  const AppRun({super.key});

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.sizeOf(context);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1.0),
                  colors: <Color>[
                    Color(0xff1f005c),
                    Color(0xff5b0060),
                    Color(0xffffb56b),
                  ],
                ).createShader(bounds),
                child: const Text(
                  'Start your Flutter IOT Project',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
              ),
              Text("width: ${appSize.width}"),
              Text("height: ${appSize.height}"),
              const SizedBox(height: 10),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: const Image(
                  image: AssetImage('assets/images/dash.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  exit(0);
                },
                child: const Text(
                  'Exit App',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
