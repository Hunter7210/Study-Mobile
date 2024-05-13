import 'package:exem_persis_json/view/cadastrar_livros_screen.dart';
import 'package:exem_persis_json/view/home_screen.dart';
import 'package:exem_persis_json/view/listar_livros_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Persistencia Json Livros",
      theme: ThemeData(primaryColor: Colors.black),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      //Criando as rotas, de navegação, facilita na escrita do codigo
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cadastro': (context) => const CadastrarLivroScreen(),
        '/listar': (context) => const ListarLivrosScreen(),
      },
    );
  }
}
