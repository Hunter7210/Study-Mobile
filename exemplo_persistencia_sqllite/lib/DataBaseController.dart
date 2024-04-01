import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Ajuda a realizar as concexões com banco e criação de tabelas
  static const String DATABASE_NAME = 'contacts.db';
  static const String TABLE_NAME = 'contacts';
  static const String CREATE_CONTACTS_TABLE_SCRIPT =
      'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, email TEXT, phone TEXT, addressLine1 TEXT)';

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
      },
      version: 1,
    );
  } //Future -significa que ela vai ser uma ação executa ao longo da aplicação
}
