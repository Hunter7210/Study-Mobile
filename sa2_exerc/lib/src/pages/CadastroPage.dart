import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/database/DataBaseController.dart';
import 'package:sa2_exerc/src/models/Model.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  String dropdownValue = 'Masculino';

  final dbHelper = DatabaseHelper();
/*   final _formKey = GlobalKey<FormState>();
 */
  bool adcionado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                const SizedBox(height: 10.0),
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
                const SizedBox(height: 10.0),
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
                const SizedBox(height: 10.0),
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
                    if (adcionado) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Você se cadastrou com sucesso!'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      print("Adicionado");
                      Navigator.pop(
                        context,
                      );
                    }
                  },
                  child: const Text("Enviar"),
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Cadastro realizado com sucesso!'),
        backgroundColor: Colors.blueGrey[600],
        duration: const Duration(seconds: 2),
      ),
    );
    dbHelper.create(newUser);
    adcionado = true;
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Usuario ja existe, tente realizar o login'),
          backgroundColor: Colors.blueGrey[600],
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      if (!checkEmpty()) {
        _addUser();
        _nomeController.text = "";
        _emailController.text = "";
        _telefoneController.text = "";
        _cepController.text = "";
        _senhaController.text = "";
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Por favor preencha todos os campos'),
            backgroundColor: Colors.blueGrey[600],
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }

    setState(() {
      // Atualiza a lista de contatos
    });
  }

  bool camposVazios = false;

  bool checkEmpty() {
    var campos = [
      _nomeController.text,
      _emailController.text,
      _telefoneController.text,
      _senhaController.text
    ];
    for (var i = 0; i < campos.length; i++) {
      if (campos[i].isEmpty) {
        camposVazios = true;
        print(campos[i]);
      }
    }
    return camposVazios;
  }
}
