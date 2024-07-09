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
      home: Center(
        child: Column(
          children: [
            Text("width: ${appSize.width}"),
            Text("height: ${appSize.height}"),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              onPressed: () {
                exit(0);
              },
              child: const Text(
                'Exit App',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
