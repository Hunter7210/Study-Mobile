import 'package:app_lista2/Produtos.dart';
import 'package:flutter/material.dart';

class ListaProdutosControler extends ChangeNotifier {
  //Atributos da classe
  //Cria uma baseada no Produto
  List<Produtos> _produtos = [];

  //Criando um Getter para acessar a lista
  List<Produtos> get produtos => _produtos;

  //Metodos da classe

  //Metodo para adicionar um novo produto a lista
  void adicionarProdutos(String descricao) {
    //Verifica se o input não esta vazio e verifica se o valor é ou tem mais que dois caracteres
    if (descricao.isNotEmpty && descricao.length >= 2) {
      // Verifica se o produto já existe na lista
      bool produtoJaExiste = _produtos.any((produto) =>
          produto.descricao ==
          descricao); //any() é usado para verificar se algum elemento da lista satisfaz uma condição

      // Se o produto não existe, adiciona-o
      if (!produtoJaExiste) {
        _produtos.add(Produtos(descricao, 0, false));
        //Notifica os ouvidos (widgets) sobre a mudança do estado
        notifyListeners();
      }
    }
  }

//Metodo para marcar como comprado
  void marcarComoComprado(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos[indice].concluida = !_produtos[indice].concluida;
      notifyListeners();
    }
  }

  void excluirProduto(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos.removeAt(indice);
      notifyListeners();
    }
  }
}
