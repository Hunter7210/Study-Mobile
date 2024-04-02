import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sa2_exerc/DataBaseController.dart';
import 'package:sa2_exerc/Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
/*  _LoginPageState createState() => _LoginPageState(); */
  _CadastroPageState createState() => _CadastroPageState();
  /*  _PreferencUserPage createState() => _PreferencUserPage();  */
}
/* 
class _LoginPageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de texto
  TextEditingController _userController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();


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
                controller: _userController,
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
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
} */

class _CadastroPageState extends State<HomePage> {
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
                    _addUser();
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

/*   void _verifyUser(){
    final 
  } */
}














/*
class _PreferencUserPage extends State<HomePage> {
  bool isDarkTheme = false;
  bool _switchValue2 = false;

  var tema = Icons.dark_mode;

  @override
  void initState() {
    super.initState();
    _carregarPreferencias();
  }

  Future<void> _salvarPreferencias(bool isDarkTheme, bool switchValue2) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDarkTheme);
    await prefs.setBool('switchValue2', switchValue2);
  }

  Future<void> _carregarPreferencias() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
      _switchValue2 = prefs.getBool('switchValue2') ?? false;
      tema = isDarkTheme ? Icons.light_mode_outlined : Icons.dark_mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch com Ícones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              title: Text("Tema"),
              value: isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  isDarkTheme = value;
                  tema =
                      isDarkTheme ? Icons.light_mode_outlined : Icons.dark_mode;
                  _salvarPreferencias(isDarkTheme, _switchValue2);
                });
              },
              secondary: Icon(tema),
            ),
            SwitchListTile(
              title: const Text('Switch 2'),
              value: _switchValue2,
              onChanged: (bool value) {
                setState(() {
                  _switchValue2 = value;
                  _salvarPreferencias(isDarkTheme, _switchValue2);
                });
              },
              secondary: const Icon(Icons.ac_unit),
            ),
          ],
        ),
      ),
    );
  }
}
 */