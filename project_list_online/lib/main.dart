import 'package:flutter/material.dart';
import 'package:project_list_online/view/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Exemplo Ativ API",
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}
