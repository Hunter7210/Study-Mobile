import 'dart:convert';
// Importa o pacote http, que fornece funções para fazer solicitações HTTP.
import 'package:http/http.dart' as http;

class WeatherService {
  final String apikey;
  final String baseUrl;

  WeatherService({required this.apikey, required this.baseUrl});

  Future<Map<String, dynamic>> getWeather(String city) async {
    final url = Uri.parse('$baseUrl/weather?q=$city&appid=$apikey');

    final response = await http.get(url);

    // Verifica se a resposta foi bem-sucedida (código de status 200).
    if (response.statusCode == 200) {
      // Se a resposta foi bem-sucedida, decodifica o corpo da resposta de JSON para um mapa.
      return jsonDecode(response.body);
    } else {
      // Se a resposta não foi bem-sucedida, lança uma exceção indicando o erro.
      throw Exception('Failed to load weather data');
    }
  }
}
