import 'dart:html';

import 'package:exem_api/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Titulo",
      color: Colors.amber,
      home: WeatherScreen(),
    );
  }
}
