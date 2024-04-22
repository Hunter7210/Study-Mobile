import 'package:flutter/material.dart';
import 'package:sa3_correcao_a/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Correção SA3",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
