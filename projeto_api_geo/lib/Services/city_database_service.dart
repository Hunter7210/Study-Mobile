import 'package:path/path.dart';
import 'package:projeto_api_geo/Model/city_model.dart';
import 'package:sqflite/sqflite.dart';

class CityDbService {
  final String DATABASE_NAME = 'city_db.db';
  final String TABLE_NAME = 'city';

  // Script SQL para criar a tabela
  final String CREATE_TABLE_SCRIPT = '''
  CREATE TABLE city (
    cityname TEXT PRIMARY KEY, 
    favoritesCities INTEGER
  )
''';

  // Método openDatabase
  Future<Database> _opendatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) async {
        await db.execute(CREATE_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  // Insert
  Future<void> insertCity(String cityName) async {
    try {
      Database db = await _opendatabase();
      Map<String, dynamic> cityMap = {
        'cityname': cityName,
        'favoritesCities': 0, // Inicializa com 0 (falso)
      };
      await db.insert(TABLE_NAME, cityMap,
          conflictAlgorithm: ConflictAlgorithm.replace);
      await db.close();
    } catch (e) {
      print(e);
    }
  }

  // List - Read
  Future<List<Map<String, dynamic>>> listCity() async {
    try {
      Database db = await _opendatabase();
      List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
      await db.close();
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
