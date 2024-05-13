import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livraria Senai'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listar');
                },
                child: const Text("Listar Livros"),
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: const Text("Cadastrar Livros"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
