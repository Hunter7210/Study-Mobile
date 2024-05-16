//Criamos um banco de dados interno, flutter pub add path e  flutter pub add sqflite

import 'package:app_sa2_diogo/Model/Usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoDadosCrud {
  //Ajuda a realizar as concexões com banco e criação de tabelas
  static const String DB_NAME = 'usuarios.db';
  static const String TABLE_NAME = 'usuarios';
  static const String CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE usuarios(id SERIAL PRIMARY KEY, nome TEXT, email TEXT UNIQUE, senha TEXT)'; //UNIQUE serve para não deixar cadastrar outro email igual, são sempre valores diferentes

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
  Future<void> create(Usuario usuModel) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, usuModel.toMap()); // Insere o contato no banco de dados
      //toMap é o metodo que mapeia as informações do meu modelo, com minha tablea, ele basicamente intermeia os campos, Exemplo: nome deve ser prenchido no campo nome etc;
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter apenas um usuario do banco de dados
  Future<Usuario?> getUsuario(String email, String senha) async {
    //Com esta o retorno é mais versáril, mas menos seguro acredito
    //Metodo de verificação de login
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
          where: 'email = ?  AND  senha = ?',
          whereArgs: [email, senha]); // Consulta  os contatos na tabela

      if (maps.isNotEmpty) {
        return Usuario.fromMap(maps.first); //Pega o primeiro
      } else {
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  // Método para verificar se o usuario no banco de dados exite retornando uma bool
  Future<bool?> existsUsuario(String email, String senha) async {
    //Com esta o retorno é true or false, porem ao trabalhar com os dados é um pouco mais complicado;
    //Metodo de verificação de login
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME,
          where: 'email = ?  AND  senha = ?',
          whereArgs: [email, senha]); // Consulta  os contatos na tabela

      if (maps.isNotEmpty) {
        return true; //Pega o primeiro
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
