import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_list_online/model/list-model.dart';

class Lista_Tarefas {
  // atributos -> lista vazia
  List<Tarefas_Model> produtos = [];

  Future<List<Tarefas_Model>> loadProdutos() async {
    try {
      // URL do arquivo JSON na nuvem
      const String url = 'LINK';

      // Faz a solicitação HTTP para obter o conteúdo do arquivo JSON
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decodifica o conteúdo JSON em uma lista dinâmica
        final jsonList = json.decode(response.body) as List<dynamic>;
        produtos.clear();
        // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
        produtos.addAll(jsonList.map((e) => Tarefas_Model.fromJson(e)));
        return produtos;
      } else {
        // Se a solicitação falhar, lança uma exceção
        throw Exception('Falha ao carregar produtos');
      }
    } catch (e) {
      // Captura e trata qualquer exceção ocorrida durante o processo
      print('Erro ao carregar produtos: $e');
      rethrow; // Re-lança a exceção para que ela seja tratada em um nível superior, se necessário
    }
  }
}
