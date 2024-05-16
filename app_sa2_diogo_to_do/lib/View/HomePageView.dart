import 'dart:async';
import 'dart:ffi';

import 'package:app_sa2_diogo/Controller/BancoDadosTarefa.dart';
import 'package:app_sa2_diogo/Model/Tarefa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  String email;
  //Passando o atributo dentro do contrutor
  PaginaHome({super.key, required this.email});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  final _controllerTarefa = TextEditingController();
  final bool _controllerConcluido;

  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false; // Estado atual do tema escuro
  IconData icone = Icons.light_mode;
  String email;
  String _idioma = "pt-br";
  List<Tarefa> _listaTarefas = [];

  _PaginaHomeState({required this.email});

  BancoDadosCRUDTarefas dbT = BancoDadosCRUDTarefas();

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

//Salvar no shared_preferences
  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ??
          false; // Assim vamos criar uma chave unica para o darmode, basicamente nó estamos concatenando o nosso email a configuração darkmode, sendo assim ele junta o meu email com o valor da minha chave booleana(no caso), sendo assim unica.//email é a minha primary key
      _idioma = _prefs.getString('${email}_idioma') ?? 'pt-br';
      _listaTarefas = _prefs.getStringList('${email}_listarTarefas') ?? [];
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema

      icone = _darkMode ? Icons.dark_mode : Icons.light_mode;
    });

    await _prefs.setBool('${email}_darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _toggleLanguage(String value) async {
    //Assincrono me permite se retornar um erro ele não vai parar o meu programa
    setState(() {
      _idioma = value; //Pode adicionar uma API para mudança de idioma
    });
    await _prefs.setString('${email}_idioma',
        _idioma); // Salva o estado do tema escuro nas preferências compartilhadas
    _listaTarefas = dbT.getTarefas();
  }



  void cadastrarUsuario(BuildContext context) async {
    String name = _controllerTarefa.text;
    bool concluido = _controllerConcluido;

    Tarefa task = Tarefa(nome: name, concluida: concluido, id: null);

    BancoDadosCRUDTarefas bancoDados = BancoDadosCRUDTarefas();
    print(task);
    try {
      bancoDados.create(task);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
      Navigator.pop(context); // Redireciona para a tela de login
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar usuário: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Define o tema com base no modo escuro
      duration:
          const Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
              'Armazenamento Interno'), // Título da barra de aplicativos
          actions: [
            IconButton(onPressed: _toggleDarkMode, icon: Icon(icone)),
            PopupMenuButton(
              icon: const Icon(Icons.language),
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: DropdownButton<String>(
                  value: _idioma,
                  onChanged: (value) {
                    _toggleLanguage(value.toString());
                  },
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: 'pt-br',
                      child: Text('Português (Brasil)'),
                    ),
                    DropdownMenuItem(
                      value: 'en-us',
                      child: Text('Inglês (EUA)'),
                    ),
                    DropdownMenuItem(
                      value: 'es-ar',
                      child: Text('Espanhol (Argentina)'),
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
        body: Column(
          children: [
            // Campo de texto para adicionar novo produto
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerTarefa,
                decoration: InputDecoration(
                  labelText: 'Nova Tarefa',
                  // Ícone para adicionar um produto ao pressionar o botão
                  suffixIcon: IconButton(
                    onPressed: () {
                      cadastrarUsuario(context);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
            // Lista de produtos usando um Consumer do Provider para atualização automática
            Expanded(
              child: ListView.builder(
                    
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(model.produtos[index].descricao),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Ícone de atualizar
                            IconButton(
                              icon: Icon(Icons.update),
                              onPressed: () {
                                _alertAtuali(context, model, index);
                              },
                            ),
                            // Checkbox para marcar o produto como comprado
                            Checkbox(
                              value: model.produtos[index].concluida,
                              onChanged: (value) {
                                model.marcarComoComprado(index);
                              },
                            ),
                          ],
                        ),
                        // Exclui a tarefa ao manter pressionado
                        onLongPress: () {
                          model.excluirProduto(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showConfirmationDialog(BuildContext context) async {
  bool confirmado = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmação"),
        content: const Text("Deseja realmente adicionar produto?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Sim'),
          ),
        ],
      );
    },
  );

/*   if (confirmado == true) {
    _listarProduto(context);
    // Limpar o campo de texto após adicionar a tarefa

    _alertConfirma(context);
  } */
}

void _alertConfirma(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Você adicionou um produto"),
        actions: <Widget>[
          //Este é o botão que aparecera no meu alert, Exemplo: Fechar, Atualizar etc
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Fecha o AlertDialog quando o botão é pressionado
            },
            child: Text('Fechar'), // Define o texto do botão como "Fechar"
          ),
        ],
      );
    },
  );
}

void _alertAtuali(BuildContext context, Tarefa, int index) async {
  TextEditingController _updateController = TextEditingController();
  _updateController.text = Tarefa.produtos[index].descricao;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Atualizar Produto"),
        content: TextField(
          controller: _updateController,
          decoration: InputDecoration(hintText: "Escreva aqui:"),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Tarefa.atualizaProduto(Tarefa.produtos[index].descricao, index,
                  _updateController.text);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: Text('Atualizar'),
          ),
          TextButton(
            onPressed: () {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: Text('Fechar'),
          ),
        ],
      );
    },
  );
}


/* 
void _listarTar(BuildContext context) async {
  // Chamando o método adicionarProduto do Provider para atualizar o estado
  return Provider.of<ListaProdutosControler>(context, listen: false)
      .adicionarProdutos(_controller.text);
} */
