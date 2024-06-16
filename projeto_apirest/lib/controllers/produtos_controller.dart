import 'dart:convert';

import 'package:projeto_apirest/models/produto.dart';

import 'package:http/http.dart' as http;

class ProdutosController {
  List<Produto> _listProdutos = [];

  List<Produto> get listProdutos => _listProdutos;

  //getPRodutosFromJson http

//O correto é criar um service e no controller chamar os metodos utilizando o try cat
  Future<List<Produto>> getProdutosFromJson() async {
    //Conentando ao servidor
    final response = await http
        .get(Uri.parse('http://10.109.207.146:3000/produto')); //Meu IP
    //Busca as informações do json
    if (response.statusCode == 200) {
      List<dynamic> result = await json.decode(response.body);
      _listProdutos = result.map((prod) => Produto.fromJson(prod)).toList();
      return _listProdutos;
    } else {
      throw Exception('Failed to load Produtos');
    }
  }

  //postProdutos toJson http
  Future<String> postProdutosToJson(Produto produto) async {
    final response = await http.post(
      Uri.parse('http://10.109.207.146:3000/produto'),
      body: json.encode(produto.toJson()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      //201  = CREATE
      return response.body;
    } else {
      throw Exception('Failed to load Produtos');
    }
  }
}
