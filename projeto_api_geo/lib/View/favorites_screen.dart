import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/city_database_controller.dart';
import 'package:projeto_api_geo/Model/city_model.dart';
import 'package:projeto_api_geo/View/details_weather_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final CityDbController _cityDbController = CityDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Favoritos'),
      ),
      body: FutureBuilder<List<City>>(
        future: _cityDbController.listcity(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Não há favoritos.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                City city = snapshot.data![index];
                return ListTile(
                    title: Text(city.cityName),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await _cityDbController.deleteCity(city.cityName);
                        setState(() {});
                      },
                    ),
                    onLongPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WeatherDetailsScreen(city: city.cityName),
                        ),
                      );
                    });
              },
            );
          }
        },
      ),
    );
  }
}
