import 'dart:convert';

import 'package:exemplo_persdistencia_json_2/model/produtos_model.dart';
import 'package:flutter/services.dart';

class ProdutosController {
  //Atributos
  List<Produto> produtos = [];

  Future<List<Produto>> loadProdutos() async {
    //Carregando os dados do arquivo
    final data = await rootBundle.loadString('assets/produtos.json');

    //Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    //Toda vez que recarregar a aplicação ele limpa a lista antes de criar uma nova
    produtos.clear();
    //Converte os objetos JSON em instâncias de Produto e adiciiona à lista de produtos
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
    return produtos;
  }
}
