import 'package:exercicios_lista1/exercism01.dart';
import 'package:exercicios_lista1/exercism02.dart';
import 'package:exercicios_lista1/exercism03.dart';
import 'package:exercicios_lista1/exercism04.dart';
import 'package:exercicios_lista1/exercism05.dart';
import 'package:exercicios_lista1/exercism06.dart';
import 'package:exercicios_lista1/exercism07.dart';
import 'package:exercicios_lista1/exercism08.dart';
import 'package:exercicios_lista1/exercism09.dart';
import 'package:exercicios_lista1/exercism10.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Center(
        child: Exercism10(),
      ),
    );
  }
}
