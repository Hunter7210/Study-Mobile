import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/database/DataBaseController.dart';
import 'package:sa2_exerc/src/pages/CadastroPage.dart';
import 'package:sa2_exerc/src/pages/ConfigPage.dart';

class HomePage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HomePage> {
  // Controllers para os campos de texto
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  final dbHelper =
      DatabaseHelper(); /* 
  final _formKey = GlobalKey<FormState>(); */

  int contador = 0;
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
            _emailController.text, _senhaController.text) &&
        verifyCampVaz() == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login realizado com sucesso!'),
          backgroundColor: Colors.amber,
          duration: Duration(seconds: 3),
        ),
      );

      //Redirecionando para a pagina de configurações
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfigPage()),
      );
      //Limpando os campos
      _emailController.text = "";
      _senhaController.text = "";
    } else if (await dbHelper.verifyUser(
                _emailController.text, _senhaController.text) ==
            true &&
        verifyCampVaz() == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor preencha todos os campos'),
          backgroundColor: Colors.blueGrey,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      if (contador >= 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Muitas tentativas verificas, tente se cadastrar!'),
            backgroundColor: Colors.blueGrey,
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuario não encontrado, tente novamente'),
            backgroundColor: Colors.blueGrey,
            duration: Duration(seconds: 3),
          ),
        );
        contador++;
      }
    }

    setState(() {
      // Atualiza a lista de contatos
    });
  }

  bool campVazio = false;
  bool verifyCampVaz() {
    var campos = [_emailController.text, _senhaController.text];
    var campPre = [];
    for (var i = 0; i < campos.length; i++) {
      campPre.add(campos[i].isEmpty);
    }
    print(campPre);
    if (campPre.contains(true)) {
      campVazio = true;
      print("Por favor preencha todos os campos");
    } else {
      print("Preenchido");
    }
    return campVazio;
  }
}
