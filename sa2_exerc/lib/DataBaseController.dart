import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sa2_exerc/Model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Ajuda a realizar as concexões com banco e criação de tabelas
  static const String DATABASE_NAME = 'usuarios.db';
  static const String TABLE_NAME = 'usuarios';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE usuarios( id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, telefone TEXT, sexo TEXT, cep TEXT, senha TEXT)';

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

  // Método para criar um novo contato no banco de dados
  Future<void> create(UsersModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, model.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contatos do banco de dados
  Future<List<UsersModel>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos os usuarios na tabela

      return List.generate(
        maps.length,
        (i) {
          return UsersModel.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos UsersModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar um contato no banco de dados
  Future<void> update(UsersModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?", // Condição para atualizar o contato com base no ID
        /*   whereArgs: [model.id], */
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para excluir um contato do banco de dados
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NAME,
        where: "id = ?", // Condição para excluir o contato com base no ID
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<bool> _verifyUser(String email) async {
    try {
      final Database db = await _getDatabase();
      final String sql = 'SELECT COUNT(*) as count FROM users WHERE email = ?';
      final List<Map<String, dynamic>> result = await db.query(TABLE_NAME,
          where: "email = ?", // Condição para excluir o contato com base no ID
          whereArgs: [email]);

      if (result.isNotEmpty) {
        final int count = result.first['count'] as int;
        return count > 0;
      }
      return false;
    } catch (e) {
      // Trata a exceção e retorna falso ou relança a exceção, dependendo da necessidade.
      print('Ocorreu um erro ao verificar o e-mail: $e');
      return false; // Ou relance a exceção com 'throw e;'
    }
  }
}
