import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listar');
                },
                child: const Text('Listar Produtos')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastrar');
                },
                child: const Text('Cadastrar Produtos')),
          ],
        ),
      ),
    );
  }
}
