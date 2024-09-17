import 'dart:io';
import 'package:flutter/material.dart';

class LinuxExitWidget extends StatelessWidget {
  const LinuxExitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
        onPressed: () {
          exit(0);
        },
        child: const Text(
          'Exit App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
