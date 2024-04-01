//PARA RODAR PRECISA INSTALAR:

//flutter pub add sqflite
//flutter pub add path
//flutter pub add path_provider

import 'package:flutter/material.dart';
import 'package:sa2_exerc/View.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Projeto SQLLite",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage());
  }
}
