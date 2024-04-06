//PARA RODAR PRECISA INSTALAR:

//flutter pub add sqflite
//flutter pub add path
//flutter pub add path_provider

import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/pages/LoginPage.dart';
import 'package:sa2_exerc/src/pages/ConfigPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variável para controlar o tema atual. Começa com o tema claro.
  bool _isDarkTheme = false;

  void _changeTheme(bool isDark) {
    setState(() {
      _isDarkTheme = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Projeto SQLLite",
      // Aplica o tema com base no valor de _isDarkTheme.
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(),
    );
  }

  // Função para carregar as preferências do usuário.
  Future<void> _carregarPrefereces() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }
}
