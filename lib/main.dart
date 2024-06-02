import 'dart:io';

import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('Exit')),
          PopupMenuButton(
            icon: const Icon(Icons.exit_to_app),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                  child: ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: const Text('Exit')))
            ],
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Start your Flutter IOT project",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "Run it on a PI",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
                onPressed: () {
                  exit(0);
                },
                child: const Text('Exit'))
          ],
        ),
      ),
    );
  }
}
