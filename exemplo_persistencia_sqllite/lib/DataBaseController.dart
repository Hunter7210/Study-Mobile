import 'dart:html';

import 'package:exemplo_persistencia_sqllite/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Ajuda a realizar as concexões com banco e criação de tabelas
  static const String DATABASE_NAME = 'contacts.db';
  static const String TABLE_NAME = 'contacts';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE contacts(id SERIAL PRIMARY KEY, name TEXT, email TEXT, phone TEXT, addressLine1 TEXT)';

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
  Future<void> create(ContactModel model) async {
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
  Future<List<ContactModel>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos os contatos na tabela

      return List.generate(
        maps.length,
        (i) {
          return ContactModel.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos ContactModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar um contato no banco de dados
  Future<void> update(ContactModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?", // Condição para atualizar o contato com base no ID
        whereArgs: [model.id],
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

  // Método para excluir um contato do banco de dados
  Future<void> inserir(ContactModel model) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        TABLE_NAME,
        model.toMap(),
      ); 
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
