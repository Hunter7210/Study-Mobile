import 'dart:convert';
import 'package:estudo_json_enviar_dados/model/livros.dart';
import 'package:http/http.dart' as http;

class LivrosService {
  // URL do servidor onde os dados dos livros estão sendo armazenados
  static const String _baseUrl = 'http://localhost:3000/livros';

  //Realizar a solicitação http para criar um novo livro
  Future<Livros> createLivros(String titulo, String autor, String condicao,
      String valor, bool disponivel) async {
    final resposta = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'titulo': titulo,
          'autor': autor,
          'condicao': condicao,
          'valor': valor,
          'disponivel': disponivel,
        },
      ),
    );

    if (resposta.statusCode == 201) {
      // Se a requisição for bem-sucedida, convertemos o JSON retornado para o objeto Livros
      // Certifique-se de que os nomes dos campos no JSON correspondam aos nomes das propriedades na classe Livros
      return Livros.fromJson(jsonDecode(resposta.body));
    } else {
      // Se o servidor não retornar uma resposta 201 CREATED, lançamos uma exceção
      throw Exception('Failed to create album.');
    }
  }

  // Realizar a solicitação http para recuperar todos os livros
  Future<List<Livros>> getAllLivros() async {
    final resposta = await http.get(Uri.parse(_baseUrl));

    if (resposta.statusCode == 200) {
      // Se a requisição for bem-sucedida, convertemos o JSON retornado para uma lista de objetos Livros
      List<dynamic> jsonData = jsonDecode(resposta.body);
      List<Livros> livros = [];
      for (var item in jsonData) {
        livros.add(Livros.fromJson(item));
      }
      return livros;
    } else {
      // Se o servidor não retornar uma resposta 200 OK, lançamos uma exceção
      throw Exception('Failed to load livros');
    }
  }
}
