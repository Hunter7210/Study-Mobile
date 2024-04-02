import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
/*   _LoginPageState createState() => _LoginPageState(); */
  /* _CadastroPageState createState() => _CadastroPageState(); */
  _PreferencUserPage createState() => _PreferencUserPage();
}
/* 
class _LoginPageState extends State<HomePage> {
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
}

class _CadastroPageState extends State<HomePage> {
  String dropdownValue = 'Masculino';

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Container(
        width: tamanhoTela.width, // Usa a largura total da tela
        height: tamanhoTela.height, // Usa a altura total da tela
        child: // Seus widgets vão aqui
            Form(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Celular',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey.shade200,
                      ),
                    ),
                  ),
                  // Adicione outras propriedades necessárias aqui
                ),
                /*  Row(children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'CEP'),
                    // Adicione outras propriedades necessárias aqui
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Numero'),
                    // Adicione outras propriedades necessárias aqui
                  ),
                ]),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Celular'),
                  // Adicione outras propriedades necessárias aqui
                ), */
                // Adicione outros TextFormField aqui
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Adicione a lógica de envio do formulário aqui
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
}
 */

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
/* COD ANTIGO 
class _PreferencUserPage extends State<HomePage> {
  bool isDarkTheme = false;
  bool _switchValue2 = false;

  var tema = Icons.dark_mode;

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
                  tema != Icons.dark_mode
                      ? tema = Icons.dark_mode
                      : tema = Icons.light_mode_outlined;
                  ThemeMode.dark;
                  isDarkTheme = value;
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