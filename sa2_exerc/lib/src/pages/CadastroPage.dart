import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/Database/DataBaseController.dart';
import 'package:sa2_exerc/src/models/Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _sexoController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  String dropdownValue = 'Masculino';

  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Expanded(
            child: Column(
              children: <Widget>[
                TextFormField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.blueGrey.shade200,
                        ),
                      ),
                    )),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey.shade200,
                      ),
                    ),
                  ),
                  // Adicione outras propriedades necessárias aqui
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _telefoneController,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey.shade200,
                      ),
                    ),
                  ),
                  // Adicione outras propriedades necessárias aqui
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  value: dropdownValue,
                  items: <String>['Masculino', 'Feminino']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                TextFormField(
                  controller: _cepController,
                  decoration: InputDecoration(
                    labelText: 'Cep',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey.shade200,
                      ),
                    ),
                  ),
                  // Adicione outras propriedades necessárias aqui
                ),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey.shade200,
                      ),
                    ),
                  ),
                  // Adicione outras propriedades necessárias aqui
                ),
                ElevatedButton(
                  onPressed: () {
                    _verifyExis(context);
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addUser() {
    final newUser = UsersModel(
      nome: _nomeController.text,
      email: _emailController.text,
      telefone: _telefoneController.text,
      sexo: dropdownValue,
      cep: _cepController.text,
      senha: _senhaController.text,
    );
    print("Adicionado com sucesso");
    dbHelper.create(newUser);
    setState(() {
      // Atualiza a lista de contatos
    });
  }

  Future<void> _verifyExis(BuildContext context) async {
    if (await dbHelper.verifyUserExis(
        _nomeController.text,
        _emailController.text,
        _telefoneController.text,
        _senhaController.text)) {
      print("Usuario ja existe, tente realizar o login");
    } else {
      print("Cadastro realizado com sucesso");
      _addUser();
      _nomeController.text = "";
      _emailController.text = "";
      _telefoneController.text = "";
      _cepController.text = "";
      _senhaController.text = "";
    }

    setState(() {
      // Atualiza a lista de contatos
    });
  }
}
