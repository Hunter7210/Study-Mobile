// Classe para abstrair o acesso ao banco de dados
import 'package:sa2_exerc/src/database/DataBaseController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

// Classe para gerenciar as preferências do usuário
class UserPreferences {
  // Tabela para armazenar as preferências
  final String tablePreferences = 'preferences';

  final DatabaseHelper database;
  final int userId;
  UserPreferences(this.database, this.userId);

  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      tasks = prefs.getStringList('tasks') ??
          []; // Carrega as tarefas armazenadas ou uma lista vazia se não houver tarefas
    });
  }

  // Salvar as preferências de um usuário
  Future<void> savePreferences(
      int userId, Map<String, String> preferences) async {
    final db = await _getDatabase(); // Obtenha a instância do banco de dados
    final res = await db.insert(TABLE_NAME, {'userId': userId, ...preferences});
  }

  // Obter o tema da aplicação
  Future<String> getTheme() async {
    final preferences = await database.getPreferences(userId);
    return preferences['theme'] ?? 'light';
  }

  // Salvar o tema da aplicação
  Future<void> setTheme(String theme) async {
    await database.savePreferences(userId, {'theme': theme});
  }
}
