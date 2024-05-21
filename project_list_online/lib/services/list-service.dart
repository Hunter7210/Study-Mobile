import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_list_online/model/list-model.dart';

//  Realizando a solicitação http, para possibilitar a busca de dados
Future<Tarefas_Model> fetchAlbum() async {
  final resposta = await http.get(Uri.parse(''));

//Verificação se a solicitação deu certo 200 = Funcionou
  if (resposta.statusCode == 200) {
    return Tarefas_Model.fromJson(jsonDecode(resposta.body));
  } else {
    throw Exception('Failed to load album');
  }
}
