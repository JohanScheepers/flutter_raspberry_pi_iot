import 'package:flutter/material.dart';

const TextStyle styleText =
    TextStyle(color: Colors.black, fontWeight: FontWeight.w900);

const List<Widget> leds = <Widget>[
  Text('Red Led'),
  Text('Green Led'),
  Text('Blue Led')
];

const List<Widget> relay = <Widget>[
  Text('Relay 1'),
  Text('Relay 2'),
  Text('Relay 3'),
  Text('Relay 4')
];

String getTime() {
  String hours = DateTime.now().hour.toString().padLeft(2, '0');
  String minutes = DateTime.now().minute.toString().padLeft(2, '0');
  String seconds = DateTime.now().second.toString().padLeft(2, '0');
  String currentTime = '$hours:$minutes:$seconds';
  return currentTime;
}
