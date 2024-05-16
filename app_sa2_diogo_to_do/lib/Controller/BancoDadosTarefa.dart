import 'dart:ffi';

import 'package:app_sa2_diogo/Model/Tarefa.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoDadosCRUDTarefas {
  //Ajuda a realizar as concexões com banco e criação de tabelas
  static const String DB_NAME = 'tarefas.db';
  static const String TABLE_NAME = 'tarefas';
  static const String CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE tarefas(id_tarefa SERIAL PRIMARY KEY, nome TEXT, concluida BOOLEAN, FOREIGN KEY (id) REFERENCES usuarios(id_tarefa))'; //UNIQUE serve para não deixar cadastrar outro email igual, são sempre valores diferentes

  //Future -significa que ela vai ser uma ação executa ao longo da aplicação
  Future<Database> _getDatabase() async {
    // DATABASE É CLASSE DO SQFLITE
    return openDatabase(
      //Usar o openDatabase para abrir a conexão, sempre realizar isso antes de qualquer ação no banco.
      join(await getDatabasesPath(),
          DB_NAME), //JOIN é o que faz criar o meu arquivo de banco de dados na maquina
      onCreate: (db, version) {
        return db.execute(CONTACTS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  // Método para criar um novo usuario no banco de dados
  Future<void> create(Tarefa tarModel) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, tarModel.toMap()); // Insere o contato no banco de dados
      //toMap é o metodo que mapeia as informações do meu modelo, com minha tablea, ele basicamente intermeia os campos, Exemplo: nome deve ser prenchido no campo nome etc;
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contatos do banco de dados
  Future<List<Tarefa>> getTarefas() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos os contatos na tabela

      return List.generate(
        maps.length,
        (i) {
          return Tarefa.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos Tarefas
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar um contato no banco de dados
  Future<void> update(Tarefa tarModel) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME,
        tarModel.toMap(),
        where: "id = ?", // Condição para atualizar o contato com base no ID
        whereArgs: [tarModel.id],
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
  Future<void> inserir(Tarefa tarmodel) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        TABLE_NAME,
        tarmodel.toMap(),
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
