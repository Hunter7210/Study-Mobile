import 'package:app_animais/model.dart';
import 'package:app_animais/view.dart';
import 'package:flutter/material.dart';

//Usar biblioteca file_picker
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaListaAnimais(),
    );
  }
}
