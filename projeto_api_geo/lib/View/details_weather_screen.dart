import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/city_database_controller.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/Model/city_model.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String city; //Para receber a informação
  const WeatherDetailsScreen({super.key, required this.city});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  final WeatherController _controller = WeatherController();
  final CityDbController _cityDbController = CityDbController();

  @override
  void initState() {
    _controller.getWeather(widget.city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Weather Details",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: _controller.getWeather(widget.city),
              builder: (context, snapshot) {
                if (_controller.weatherList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_controller.weatherList.last.name),
                          IconButton(
                            icon: const Icon(Icons.favorite_border_outlined),
                            onPressed: () async {
                              // Assuming you want to add the last weather data to favorites
                              try {
                                await _cityDbController.addCity(widget.city);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Cidade adicionada aos favoritos com sucesso!'),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Ocorreu um erro ao adicionar cidade aos favoritos!'),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                      Text(_controller.weatherList.last.description),
                      Text((_controller.weatherList.last.temp - 273)
                          .toStringAsFixed(2)),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
