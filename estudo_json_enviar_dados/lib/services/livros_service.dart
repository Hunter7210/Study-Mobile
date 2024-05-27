import 'dart:convert';

import 'package:estudo_json_enviar_dados/model/livros.dart';
import 'package:http/http.dart' as http;

class LivrosService {
  //Realizar a solicitação http e a inserção de dados nela
  Future<Livros> createLivros(String titulo, String autor, bool alugado) async {
    final resposta = await http.post(
      Uri.parse('http://10.109.207.117:3000/usuarios'),
      //Headers são basicamente os selos de uma carta, nele pode conter requisições de autenticações, alem de informar em qual formato os dados estão sendo enviados, como neste caso onde estamos passando em JSON com UTF-8
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(
        <String, dynamic>{
          //KEY = String, VALUE = dynamic  //Neste caso
          'titulo': titulo,
          'autor': autor,
          'alugado': alugado
        },
      ),
    );

    if (resposta.statusCode == 201) {
      // code 201 CREATED resposta,
      // then parse the JSON.
      return Livros.fromJson(jsonDecode(resposta.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
