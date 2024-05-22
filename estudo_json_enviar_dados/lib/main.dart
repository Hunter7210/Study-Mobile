import 'package:estudo_json_enviar_dados/screen/livros_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exemplo Enviar dados no JSON',
      debugShowCheckedModeBanner: false,
      home: LivrosScreen(),
    );
  }
}
