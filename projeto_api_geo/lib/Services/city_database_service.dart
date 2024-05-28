import 'package:path/path.dart';
import 'package:projeto_api_geo/Model/city_model.dart';
import 'package:sqflite/sqflite.dart';

class CityDbService {
  //Service somente para conectar no banco
  final String DATABASE_NAME = 'city_db.db'; // Nome do banco de dados
  final String TABLE_NAME = 'city'; // Nome da tabela
  final String CREATE_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE city(
          cityname TEXT PRIMARY KEY, 
          favoritesCities BOOLEAN
          )""";

  //Método openDatabase
  Future<Database> _opendatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) => CREATE_TABLE_SCRIPT,
      version: 1,
    );
  }

  //crud
  //insert
  Future<void> insertCity(City city) async {
    try {
      Database db = await _opendatabase();
      await db.insert(TABLE_NAME, city.toMap());
      db.close();
    } catch (e) {
      print(e);
    }
  }

  //list - read
  Future<List<Map<String, dynamic>>> listCity() async {
    try {
      Database db = await _opendatabase();
      List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
      db.close();
      return maps;
    } catch (e) {
      print(e);
      return [];
    }
  }

  //delete
  Future<void> deleteCity(String city) async {
    try {
      Database db = await _opendatabase();
      db.delete(TABLE_NAME, where: 'cityname =?', whereArgs: [city]);
      db.close();
    } catch (e) {
      print(e);
    }
  }

  //update favoritesCities
  Future<void> updateCity(City city) async {
    try {
      Database db = await _opendatabase();
      db.update(TABLE_NAME, city.toMap(),
          where: 'cityname =?', whereArgs: [city.cityName]);
      db.close();
    } catch (e) {
      print(e);
    }
  }
}
