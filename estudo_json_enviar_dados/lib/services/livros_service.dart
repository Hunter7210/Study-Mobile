import 'dart:convert';
import 'package:estudo_json_enviar_dados/model/livros.dart';
import 'package:http/http.dart' as http;

class LivrosService {
  // URL do servidor onde os dados dos livros estão sendo armazenados
  static const String _baseUrl = 'http://10.109.195.177:3000/livros';

  /// Realizar a solicitação HTTP para criar um novo livro
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
      return Livros.fromJson(jsonDecode(resposta.body));
    } else {
      throw Exception('Failed to create livro.');
    }
  }

  // Realizar a solicitação HTTP para recuperar todos os livros
  Future<List<Livros>> getAllLivros() async {
    final resposta = await http.get(Uri.parse(_baseUrl));

    if (resposta.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(resposta.body);
      return jsonData.map((item) => Livros.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load livros');
    }
  }

  // Realizar a solicitação HTTP para atualizar um livro existente
  Future<Livros> updateLivro(Livros livro) async {
    final url = Uri.parse('$_baseUrl/${livro.id}');
    final resposta = await http.put(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(livro.toMap()),
    );

    if (resposta.statusCode == 200) {
      return Livros.fromJson(jsonDecode(resposta.body));
    } else {
      throw Exception('Failed to update livro');
    }
  }

  Future<void> deleteLivro(String id) async {
    final url = Uri.parse('$_baseUrl/$id');
    final resposta = await http.delete(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    if (resposta.statusCode != 200) {
      throw Exception('Failed to delete livro');
    }
  }
}
