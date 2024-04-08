//PARA RODAR PRECISA INSTALAR:

//flutter pub add sqflite
//flutter pub add path
//flutter pub add path_provider

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa2_exerc/src/configs/app_settings.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Projeto SQLLite",
        theme: ThemeData.light(),
        home: HomePage(),
      ),
    );
  }
}
