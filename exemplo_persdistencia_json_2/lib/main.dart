import 'package:exemplo_persdistencia_json_2/view/produtos_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistencia JSON 2',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const ProdutosPage(),
    );
  }
}
