/* import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSP extends StatefulWidget {
  const UserSP({super.key});

  @override
  State<UserSP> createState() => _UserSPState();
}

class _UserSPState extends State<UserSP> { 
  @override
  void initState() {
    super.initState();
    loadTasks(); // Carrega as tarefas ao iniciar a tela
  }

  Future<void> loadtheme() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      tema = prefs.getKeys(
          'tema'); // Carrega as tarefas armazenadas ou uma lista vazia se não houver tarefas
    });
  }

  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    await prefs.setStringList('tasks',
        tasks); // Salva a lista de tarefas nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
 */