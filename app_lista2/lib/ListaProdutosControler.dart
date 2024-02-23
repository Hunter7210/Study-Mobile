import 'package:app_lista2/Produtos.dart';
import 'package:flutter/material.dart';

class ListaProdutosConstroler extends ChangeNotifier {
  //Atributos da classe
  //Cria uma baseada no Produto
  List<Produtos> _produtos = [];

  //Criando um Getter para acessar a lista
  List<Produtos> get produtos => _produtos;

  //Metodos da classe

  //Metodo para adicionar um novo produto a lista
  void adicionarProdutos(String descricao) {
    _produtos.add(Produtos(descricao, 0, false));
    //Notifica os ouvidos (widgets) sobre a mudança do estado
    notifyListeners();
  }

//Metodo para marcar como comprado
  void marcarComoComprado(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos[indice].concluida = true;
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
