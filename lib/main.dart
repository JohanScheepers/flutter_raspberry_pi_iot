import 'package:flutter/material.dart';
import 'package:flutter_raspberry_pi_iot/service/gpio_service.dart';
import 'package:flutter_raspberry_pi_iot/widgets/flutter_logo_widget.dart';
import 'package:flutter_raspberry_pi_iot/widgets/led_control_button.dart';
import 'package:flutter_raspberry_pi_iot/widgets/time_size_widget.dart';
import 'package:flutter_raspberry_pi_iot/widgets/welcom_widget.dart';

void main() {
  runApp(const AppRun());
}

class AppRun extends StatefulWidget {
  const AppRun({super.key});

  @override
  State<AppRun> createState() => _AppRunState();
}

class _AppRunState extends State<AppRun> {
  bool _myLed22 = false;
  bool _myLed23 = false;
  bool _myLed24 = false;
  bool _myLed25 = false;
  bool _myLed26 = false;

  final LedService ledService = LedService();

  @override
  void initState() {
    ledService.initGpioOutput();
    super.initState();
  }

  @override
  void dispose() {
    ledService.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pi IOT',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          actions: const [
            TimeSizeWidget(),
          ],
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WelcomWidget(),
              const FlutterLogoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LedControlButton(
                    ledName: 'Led 22',
                    boxColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        _myLed22 = !_myLed22;
                        ledService.gpio22OutputLevel(_myLed22);
                      });
                    },
                    ledStatus: _myLed22,
                  ),
                  LedControlButton(
                    ledName: 'Led 23',
                    boxColor: Colors.yellow,
                    onPressed: () {
                      setState(() {
                        _myLed23 = !_myLed23;
                        ledService.gpio23OutputLevel(_myLed23);
                      });
                    },
                    ledStatus: _myLed23,
                  ),
                  LedControlButton(
                    ledName: 'Led 24',
                    boxColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        _myLed24 = !_myLed24;
                        ledService.gpio24OutputLevel(_myLed24);
                      });
                    },
                    ledStatus: _myLed24,
                  ),
                  LedControlButton(
                    ledName: 'Led 25',
                    boxColor: Colors.yellow,
                    onPressed: () {
                      setState(() {
                        _myLed25 = !_myLed25;
                        ledService.gpio25OutputLevel(_myLed25);
                      });
                    },
                    ledStatus: _myLed25,
                  ),
                  LedControlButton(
                    ledName: 'Led 26',
                    boxColor: Colors.red,
                    onPressed: () {
                      setState(() {
                        _myLed26 = !_myLed26;
                        ledService.gpio26OutputLevel(_myLed26);
                      });
                    },
                    ledStatus: _myLed26,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
