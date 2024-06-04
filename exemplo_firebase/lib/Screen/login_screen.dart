import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Titulo"),
            const SizedBox(
              height: 30.0,
            ),
            const Text("Usuario"),
            TextFormField(
              decoration: const InputDecoration(labelText: "Insira o usuario:"),
            ),
            const Text("Senha"),
            TextFormField(
              decoration: const InputDecoration(labelText: "Insira a senha:"),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
