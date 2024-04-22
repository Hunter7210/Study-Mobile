import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class PaginaHome extends StatefulWidget {
  String email;
  //Passando o atributo dentro do contrutor
  PaginaHome({super.key, required this.email});

  @override
  // ignore: no_logic_in_create_state
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false; // Estado atual do tema escuro
  IconData iconsEsco = Icons.light_mode;
  bool _concluida = false;
  String email;
  String _idioma = "pt-br";

  List<String> _tasks = [];
  final TextEditingController _nomeTarefa = TextEditingController();

  _PaginaHomeState({required this.email});

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
      _concluida = _prefs.getBool('${email}_tasks') ?? false;

      _tasks = _prefs.getStringList('${email}tasks') ?? [];

      _darkMode = _prefs.getBool('${email}_darkMode') ??
          false; // Assim vamos criar uma chave unica para o darmode, basicamente nó estamos concatenando o nosso email a configuração darkmode, sendo assim ele junta o meu email com o valor da minha chave booleana(no caso), sendo assim unica.//email é a minha primary key
      _idioma = _prefs.getString('${email}_idioma') ?? 'pt-br';
    });
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    await prefs.setStringList('${email}tasks',
        _tasks); // Salva a lista de tarefas nas preferências compartilhadas
  }

  Future<void> upTasks(int index) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Atualizar Produto"),
          content: TextField(
            controller: _nomeTarefa,
            decoration: const InputDecoration(hintText: "Escreva aqui:"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _tasks[index] = _nomeTarefa.text;
                });
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Atualizar'),
            ),
            TextButton(
              onPressed: () {
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _toggleisDone() async {
    setState(() {
      _concluida = !_concluida;
    });
    await _prefs.setBool('${email}_concluida',
        _concluida); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
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
          title: const Text(
              'Armazenamento Interno'), // Título da barra de aplicativos
          actions: [
            IconButton(
              onPressed: () {
                _toggleDarkMode();
                iconsEsco = _darkMode ? Icons.dark_mode : Icons.light_mode;
              },
              icon: Icon(iconsEsco),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.public),
              tooltip: 'Mundo',
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
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length, // Número de itens na lista de tarefas
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_tasks[index]), // Título do item da lista
                    leading: Checkbox(
                      value:
                          _concluida, // Substitua com a variável que controla se a tarefa está concluída
                      onChanged: (bool? value) {
                        setState(() {
                          upTasks(index);
                          _toggleisDone();
                          saveTasks(); // Salva as tarefas atualizadas
                        });
                      },
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Isso garante que o Row ocupa o mínimo de espaço necessário
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.delete), // Ícone de delete
                          onPressed: () {
                            setState(() {
                              _confirmDelete(context, index);
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.update), // Ícone de upgrade
                          onPressed: () {
                            // Adicione a lógica para atualizar a tarefa aqui
                          },
                        ),
                      ],
                    ),
                    onLongPress: () {
                      setState(() {
                        _tasks.removeAt(index); // Remove a tarefa da lista
                        saveTasks(); // Salva as tarefas atualizadas
                      });
                    },
                  );
                },
              ),
            ),
            // Campo de texto para adicionar nova tarefa
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nomeTarefa,
                decoration: InputDecoration(
                  labelText: 'Nova Tarefa',
                  // Ícone para adicionar tarefa ao pressionar o botão
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_nomeTarefa.text.isNotEmpty) {
                          _tasks.add(_nomeTarefa.text);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                const Text('Tarefa adicionada com sucesso!'),
                          ));
                          _nomeTarefa.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                                'Ocorreu um erro ao adicionar tarefa!'),
                          ));
                        }
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Tem certeza de que deseja excluir esta tarefa?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () {
                setState(() {
                  _tasks.removeAt(index); // Remove a tarefa da lista
                  saveTasks(); // Salva as tarefas atualizadas
                });
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
