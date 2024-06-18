import 'package:projeto_api_geo/Services/city_database_service.dart';

import '../Model/city_model.dart';

class CityDbController {
  //atributos
  List<City> _cities = [];

  final CityDbService _service = CityDbService();

  //get cities
  List<City> cities() => _cities;

  Future<List<City>> listcity() async {
    List<Map<String, dynamic>> maps = await _service.listCity();
    // for (Map<String, dynamic> map in maps) {
    //   cities.add(City.fromMap(map));
    // }
    _cities = maps.map<City>((e) => City.fromMap(e)).toList();
    return _cities;
  }

  //add city
  Future<void> addCity(String city) async {
    await _service.insertCity(city);
  }

  //update city
  Future<void> updateCity(City city) async {
    await _service.updateCity(city);
  }

  //delete city
  Future<void> deleteCity(String city) async {
    await _service.deleteCity(city);
  }
}
