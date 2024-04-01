import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Ajuda a realizar as concexões com banco e criação de tabelas
  static const String DATABASE_NAME = 'users.db';
  static const String TABLE_NAME = 'users';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE users(id SERIAL PRIMARY KEY, nome TEXT, email TEXT, telefone TEXT, celular TEXT, endereco TEXT)';

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
}
