import 'package:exer_list_2_01/exercism01.dart';
import 'package:exer_list_2_01/exercism02.dart';
import 'package:exer_list_2_01/exercism03.dart';
import 'package:exer_list_2_01/exercism04.dart';
import 'package:exer_list_2_01/exercism05.dart';
import 'package:exer_list_2_01/exercism06.dart';
import 'package:exer_list_2_01/exercism07.dart';
import 'package:exer_list_2_01/exercism08.dart';
import 'package:flutter/material.dart';

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
      home: Exercism08(),
    );
  }
}
