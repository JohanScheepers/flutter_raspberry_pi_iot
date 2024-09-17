import 'package:flutter/material.dart';
import 'package:flutter_raspberry_pi_iot/widgets/flash_output.dart';
import 'package:flutter_raspberry_pi_iot/widgets/flutter_logo_widget.dart';
import 'package:flutter_raspberry_pi_iot/widgets/gpio_input.dart';
import 'package:flutter_raspberry_pi_iot/widgets/output_control_button.dart';
import 'package:flutter_raspberry_pi_iot/widgets/output_flash_control_button.dart';
import 'package:flutter_raspberry_pi_iot/widgets/time_size_widget.dart';
import 'package:flutter_raspberry_pi_iot/widgets/welcom_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WelcomWidget(),
            FlutterLogoWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Outputs"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutputControlButton(
                          ledName: 'Led 22 Output State',
                          boxColor: Colors.red,
                          gpio: 22,
                          flexWidth: 3,
                          flexHeight: 6,
                        ),
                        OutputFlashControlButton(
                            ledName: 'Led 23 Flash Control',
                            boxColor: Colors.yellow,
                            gpio: 23,
                            flexWidth: 3,
                            flexHeight: 6),
                        OutputFlash(
                            ledName: "Led Flash",
                            boxColor: Colors.red,
                            gpio: 24,
                            flexWidth: 3,
                            flexHeight: 6)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Inputs'),
                    GpioInput(
                      gpio: 27,
                      flexWidth: 3,
                      flexHeight: 6,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
