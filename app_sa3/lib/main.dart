import 'package:app_sa3/View/LoginPageView.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "SA3_ATIVIDADE",
      debugShowCheckedModeBanner: false,
      home: PaginaLogin(),
    );
  }
}
