import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    _getWeather();
    super.initState();
  }

  Future<void> _getWeather() async {
    try {
      Position _position = await Geolocator.getCurrentPosition();
      print(_position.latitude);
      _controller.getWeatherbyLocation(_position.latitude, _position.longitude);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previsão do Tempo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorites');
                    },
                    child: const Text("Favorites")),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                    child: const Text("Localization"))
              ],
            ),
            const SizedBox(height: 20),
            //construir a exibição do clima(geolocalização)
            Builder(
              builder: (context) {
                if (_controller.weatherList.isEmpty) {
                  return Column(children: [
                    const Text("Localização Não Encontrada"),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        _getWeather();
                      },
                    )
                  ]);
                } else {
                  return Column(
                    children: [
                      Text(_controller.weatherList.last.name),
                      Text(_controller.weatherList.last.main),
                      Text(_controller.weatherList.last.description),
                      Text(
                          (_controller.weatherList.last.temp - 273).toString()),
                      Text((_controller.weatherList.last.tempMax - 273)
                          .toString()),
                      Text((_controller.weatherList.last.tempMin - 273)
                          .toString()),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          _getWeather();
                        },
                      )
                    ],
                  );
                }
              },
            )
          ],
        )),
      ),
    );
  }
}
