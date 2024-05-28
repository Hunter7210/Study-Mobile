import 'package:flutter/foundation.dart';

class City {
  final String cityName;
  final bool favoritesCities;

  City({required this.cityName, required this.favoritesCities});

  //Métodos

   //toMap
   //Do banco para o meu objeto
  Map<String, dynamic> toMap() {
    return {
      'cityname': cityName,
      'favoritescities': favoritesCities,
    };
  }

  //FromMap
factory City.fromMap(Map<String, dynamic> map){
  return City(cityName: map['cityname'], favoritesCities: map['favoritesCities'])
}


}
