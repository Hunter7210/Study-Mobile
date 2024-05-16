// Importa o pacote de widgets do Flutter, que contém os widgets para construir interfaces de usuário.
import 'package:api_weather_ativ/Controller/Services/clima_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// Importa o serviço WeatherService, que é responsável por obter os dados de previsão do tempo da API.

// Classe StatefulWidget que representa o widget de previsão do tempo.
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  // Sobrescreve o método createState para criar e retornar uma instância do estado do widget.
  @override
  // ignore: library_private_types_in_public_api
  _WeatherScreenState createState() => _WeatherScreenState();
}

// Classe que representa o estado do widget de previsão do tempo.
class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
/*   final _formKey = GlobalKey<FormState>(); */

  // Instância do serviço WeatherService para obter os dados de previsão do tempo.
  final WeatherService _weatherService = WeatherService(
    apiKey:
        '681126f28e7d6fa3a7cfe0da0671e599', // Chave de API para acesso à API de previsão do tempo.
    baseUrl:
        'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  // Mapa que armazenará os dados de previsão do tempo.
  late Map<String, dynamic> _weatherData;

  // Método chamado quando o estado é inicializado.
  @override
  void initState() {
    super.initState();
    _weatherData = {
      'name': '',
      'main': {'temp': 0},
      'weather': [
        {'description': ''}
      ]
    };
  }

  // Método assíncrono para buscar os dados de previsão do tempo para uma cidade específica.
  Future<void> _fetchWeatherData(String city) async {
    try {
      // Obtém os dados de previsão do tempo para a cidade especificada.
      final weatherData = await _weatherService.getWeather(city);
      // Atualiza o estado do widget com os novos dados de previsão do tempo.
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      // Em caso de erro ao buscar os dados de previsão do tempo, exibe uma mensagem de erro no console.
      print('Error fetching weather data: $e');
    }
  }

  Future<void> _fetchWeatherGeo() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final weatherData = await _weatherService.getWeatherbyLocation(
          position.latitude, position.longitude);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  // Método responsável por construir a interface de usuário do widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        backgroundColor: Colors.cyan,

        // Título da barra de aplicativos.
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                    onChanged: (value) {
                      _fetchWeatherData(_cityController.text);
                    },
                    controller: _cityController,
                    decoration: const InputDecoration(
                        labelText: "Insira a Cidade",
                        icon: Icon(Icons.search),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira a Cidade';
                      }
                      return null;
                    }),
                FutureBuilder(
                    future: _fetchWeatherGeo(),
                    builder: (context, snapshot) {
                      if (_weatherData.isEmpty) {
                        return const Center(
                          child: Text(''),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              color: Colors.blueAccent,
                              width: 300,
                              height: 100,
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.cloud),
                                  Text(
                                    'City: ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    '${_weatherData['name'],}',
                                    style: const TextStyle(fontSize: 30),
                                  ), // Exibe o nome da cidade.
                                ],
                              ), // Exibe a temperatura em graus Celsius.
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 150,
                                  color: Color.fromARGB(255, 0, 74, 185),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Temperature: ',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        ' ${_weatherData['main']['temp'] - 273} °C',
                                        style: const TextStyle(fontSize: 40),
                                      )
                                    ],
                                  ), // Exibe a temperatura em graus Celsius.
                                ),
                                Expanded(
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    color: Color.fromARGB(255, 2, 135, 175),
                                    child: Text(
                                        'Description: ${_weatherData['weather'][0]['description']}'), // Exibe a descrição do clima.
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
