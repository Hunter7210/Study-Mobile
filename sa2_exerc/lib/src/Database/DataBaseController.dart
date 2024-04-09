import 'dart:async';
import 'package:path/path.dart';
import 'package:sa2_exerc/src/models/Model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Ajuda a realizar as concexões com banco e criação de tabelas
  static const String DATABASE_NAME = 'usuarios.db';
  static const String TABLE_NAME = 'usuarios';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE usuarios( id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, telefone TEXT, sexo TEXT, cep TEXT, senha TEXT)';

  late int userId;

  //Future -significa que ela vai ser uma ação executa ao longo da aplicação
  Future<Database> _getDatabase() async {
    // DATABASE É CLASSE DO SQL LITE
    return openDatabase(
      //Usar o openDatabase para abrir a conexão, sempre realizar isso antes de qualquer ação no banco.
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  // Obter as preferências de um usuário
  Future<String> getPreferences() async {
    final db = await _getDatabase(); // Obtenha a instância do banco de dados
    final res =
        await db.query(TABLE_NAME, where: 'id = ?', whereArgs: [userId]);
    return res.map((row) => row.toString()).first;
  }

  // Salvar as preferências de um usuário
  Future<void> savePreferences(
      int userId, Map<String, String> preferences) async {
    final db = await _getDatabase(); // Obtenha a instância do banco de dados
    final res = await db.insert(TABLE_NAME, {'userId': userId, ...preferences});
  }

  //Metodo para buscar o Id do usuario
  Future<Object?> userByID(String email) async {
    final db = await _getDatabase(); // Obtenha a instância do banco de dados
    final res = await db.query(
      TABLE_NAME,
      where: 'email= ?',
      whereArgs: [email],
    );
    return res.first['id'];
  }

  // Método para criar um novo contato no banco de dados
  Future<void> create(UsersModel model) async {
    try {
      final Database db = await _getDatabase();
      final res = await db.insert(TABLE_NAME, model.toMap());
      print(res); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<bool> verifyUser(String email, String senha) async {
    final db = await _getDatabase(); // Obtenha a instância do banco de dados
    final res = await db.query(
      TABLE_NAME, // Substitua pelo nome da sua tabela
      where: 'email = ? AND senha= ?',
      whereArgs: [email, senha],
    );
    print(res);

    return res.isNotEmpty; // Retorna verdadeiro se encontrar algum registro
  }

//Verifica se meu usuario ja existe no banco de dados antes de cadastra-lo
  Future<bool> verifyUserExis(
      String nome, String email, String telefone, String senha) async {
    final db = await _getDatabase(); // Obtenha a instância do banco de dados
    final res = await db.query(
      TABLE_NAME,
      where: 'nome= ? AND email = ? AND telefone= ? AND senha= ?',
      whereArgs: [nome, email, telefone, senha],
    );

    print(res);

    return res.isNotEmpty; // Retorna verdadeiro se encontrar algum registro
  }
}
