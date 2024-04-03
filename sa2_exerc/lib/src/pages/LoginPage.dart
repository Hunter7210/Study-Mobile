import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/Database/DataBaseController.dart';
import 'package:sa2_exerc/src/models/Model.dart';
import 'package:sa2_exerc/src/pages/CadastroPage.dart';
import 'package:sa2_exerc/src/pages/ConfigPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  /*  _CadastroPageState createState() => _CadastroPageState(); */
  /*  _PreferencUserPage createState() => _PreferencUserPage();  */
}

class _LoginPageState extends State<HomePage> {
  // Controllers para os campos de texto
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 181, 200, 255).withOpacity(0.1),
                spreadRadius: 10.0,
                offset: Offset(0.0, 3.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(children: [
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
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.blueGrey.shade200,
                    ),
                  ),
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      verifyCampVaz();
                      _verify(context);
                    },
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CadastroPage()),
                      );
                      _emailController.text = "";
                      _senhaController.text = "";
                    },
                    child: Text('Cadastre-se'),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> _verify(BuildContext context) async {
    if (await dbHelper.verifyUser(
        _emailController.text, _senhaController.text)) {
      print("Achou");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfigPage()),
      );
      _emailController.text = "";
      _senhaController.text = "";
    } else {
      print("Usuário não encontrado, tente se cadastrar");
    }

    setState(() {
      // Atualiza a lista de contatos
    });
  }

  void verifyCampVaz() {
    var campos = [_emailController.text, _senhaController.text];
    var camppre = [];
    for (var i = 0; i < campos.length; i++) {
      camppre.add(campos[i].isEmpty);
    }
    print(camppre);
    if (camppre.contains(true)) {
      print("Por favor preencha todos os campos");
    } else {
      print("Preenchido");
    }
  }
}
