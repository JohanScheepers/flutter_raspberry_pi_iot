import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter IOT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = -25.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
            color: Colors.deepPurple,
            icon: const Icon(Icons.exit_to_app),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text(
                        'Exit App',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                ),
              ))
            ],
          )
        ],
      ),
      body: Center(
        child: Container(
          width: 550,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Gauge1(value: -25.1, title: "Freezer 01"),
                      Gauge1(value: -22.5, title: "Freezer 02"),
                    ],
                  ),
                  Row(
                    children: [
                      Gauge1(value: -27.7, title: "Freezer 03"),
                      Gauge1(value: -23.2, title: "Freezer 04"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 330,
                width: 150,
                child: Card.outlined(
                  //clipBehavior: Clip.antiAliasWithSaveLayer,
                  shadowColor: Colors.blueAccent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Freezer Set Point"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 225,
                          child: SfSlider.vertical(
                              min: -35.0,
                              max: 0.0,
                              value: _value,
                              interval: 5,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  _value = value;
                                });
                              }),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_value.toStringAsFixed(1)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Gauge1 extends StatelessWidget {
  const Gauge1({super.key, required this.value, required this.title});

  final double value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 190,
      child: Card.outlined(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shadowColor: Colors.blueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                child: Text(title),
              ),
            ),
            SizedBox(
              height: 110,
              width: 200,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: -35,
                    maximum: 0,
                    axisLabelStyle: const GaugeTextStyle(
                        color: Color(0xff7ecf28), fontWeight: FontWeight.w500),
                    showLastLabel: true,
                    //labelFormat: '{value}$units',
                    labelOffset: 15,
                    ranges: [
                      GaugeRange(
                        startValue: -35,
                        endValue: -29,
                        color: Colors.lightBlue,
                      ),
                      GaugeRange(
                        startValue: -29,
                        endValue: -18,
                        color: Colors.blue,
                      ),
                      GaugeRange(
                        startValue: -18,
                        endValue: -15,
                        color: Colors.lightBlue,
                      ),
                      GaugeRange(
                        startValue: -15,
                        endValue: -10,
                        color: Colors.orange,
                      ),
                      GaugeRange(
                        startValue: -10,
                        endValue: 0,
                        color: Colors.red,
                      )
                    ],
                    pointers: [
                      NeedlePointer(
                        value: value,
                        animationDuration: 1000,
                        enableAnimation: true,
                        animationType: AnimationType.bounceOut,
                        needleEndWidth: 5,
                        needleStartWidth: 1,
                        needleColor: Colors.white,
                        knobStyle: const KnobStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                child: Text("$value °C"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
