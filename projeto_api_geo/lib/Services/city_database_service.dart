import 'package:sqflite/sqflite.dart';

class CityDbService {
  //Service somente para conectar no banco
  final String DATABASE_NAME = 'city_db.db'; // Nome do banco de dados
  final String TABLE_NAME = 'city'; // Nome da tabela
  final String CREATE_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE city(
          cityname TEXT PRIMARY KEY, 
          favorites BOOLEAN
          )""";

  //Método openDatabase
  Future<Database> _opendatabase() async {
    return await openDatabase(
      DATABASE_NAME,
      version: 1,
      onCreate: CREATE_TABLE_SCRIPT,
    );
  }
}
