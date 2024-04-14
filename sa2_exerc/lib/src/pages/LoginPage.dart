import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/database/DataBaseController.dart';
import 'package:sa2_exerc/src/pages/CadastroPage.dart';
import 'package:sa2_exerc/src/pages/ConfigPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HomePage> {
  // Controllers para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  final dbHelper = DatabaseHelper(); // Instância do DBHelper

  int contador = 0; // Contador de tentativas de login

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(children: [
              // Campo de entrada para o email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.blueGrey.shade200,
                    ),
                  ),
                  hintText: 'Usuário',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16.0),
              // Campo de entrada para a senha
              TextField(
                controller: _senhaController,
                obscureText: true, // Oculta o texto digitado
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.blueGrey.shade200,
                    ),
                  ),
                  hintText: 'Senha',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16.0),
              // Botões para login e cadastro
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Função para verificar se os campos estão vazios e realizar o login
                      verifyCampVaz();

                      _verify(context);
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navega para a página de cadastro
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroPage()),
                      );
                      // Limpa os campos de email e senha
                      _emailController.clear();
                      _senhaController.clear();
                    },
                    child: const Text('Cadastre-se'),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  // Função para realizar a verificação e login
  Future<void> _verify(BuildContext context) async {
    bool isEmpty = verifyCampVaz(); // Verifica se há campos vazios

    // Se houver campos vazios, exibe um snackbar e retorna
    if (isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor preencha todos os campos'),
          backgroundColor: Colors.blueGrey,
          duration: Duration(seconds: 3),
        ),
      );

      return;
    }

    // Se excedeu o número máximo de tentativas, exibe um snackbar e retorna
    if (contador >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Muitas tentativas verificadas, tente se cadastrar!'),
          backgroundColor: Colors.blueGrey,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // Verifica se o usuário existe no banco de dados
    bool userExists =
        await dbHelper.verifyUser(_emailController.text, _senhaController.text);

    if (userExists) {
      // Se o usuário existe, exibe um snackbar de sucesso, navega para a página de configurações e limpa os campos
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login realizado com sucesso!'),
          backgroundColor: Colors.blueGrey,
          duration: Duration(seconds: 3),
        ),
      );
      verifyCampVaz();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfigPage()),
      );

      _emailController.clear();
      _senhaController.clear();
    } else {
      // Se o usuário não existe, exibe um snackbar de erro e incrementa o contador de tentativas
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário não encontrado, tente novamente'),
          backgroundColor: Colors.blueGrey,
          duration: Duration(seconds: 3),
        ),
      );
      contador++;
    }

    setState(() {
      // Atualiza a lista de contatos
    });
  }

  // Função para verificar se há campos vazios
  bool verifyCampVaz() {
    bool isAnyEmpty =
        _emailController.text.isEmpty || _senhaController.text.isEmpty;
    if (isAnyEmpty) {
      print("Por favor preencha todos os campos");
    } else {
      print("Preenchido");
    }
    return isAnyEmpty;
  }
}
