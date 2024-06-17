import 'package:exemplo_firebase/controllers/todolist_controller.dart';
import 'package:exemplo_firebase/models/todolist.dart';
import 'package:flutter/material.dart';

class ListDataScreen extends StatefulWidget {
  final String userId;

  const ListDataScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _ListDataScreenState createState() => _ListDataScreenState();
}

class _ListDataScreenState extends State<ListDataScreen> {
  List<Todolist> _listaTarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    List<Todolist> lista = await TodolistController().fetchList(widget.userId);
    setState(() {
      _listaTarefas = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Dados'),
      ),
      body: _listaTarefas.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: (context, index) {
                Todolist tarefa = _listaTarefas[index];
                return ListTile(
                  title: Text(tarefa
                      .titulo), // Suponho que "titulo" seja um atributo de Todolist
                  subtitle: Column(
                    children: [
                      Text("User ID:${tarefa.userId}"),
                      Text("TimerStamp:${tarefa.timestamp}"),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
