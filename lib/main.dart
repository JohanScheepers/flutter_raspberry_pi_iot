import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_raspberry_pi_iot/page/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  runApp(const AppRun());
}

class AppRun extends StatefulWidget {
  const AppRun({super.key});

  @override
  State<AppRun> createState() => _AppRunState();
}

class _AppRunState extends State<AppRun> {
  @override
  Widget build(BuildContext context) {
    //_myLed27 = ledService.gpio27InputLevel(inputValue);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const MainPage(),
    );
  }
}

