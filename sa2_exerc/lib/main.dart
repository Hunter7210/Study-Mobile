//PARA RODAR PRECISA INSTALAR:

//flutter pub add sqflite
//flutter pub add path
//flutter pub add path_provider

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa2_exerc/src/configs/number_format.dart';
import 'package:sa2_exerc/src/pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projeto SQLLite",
      theme: ThemeData(
        brightness: Brightness.light, // Define o tema claro como padrão
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Define o tema escuro
      ),
      home: const HomePage(),
    );
  }
}
