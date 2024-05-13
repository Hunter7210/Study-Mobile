//id, titulo, autor, sinopse, categoria, capa, editora, isbn, preco

import 'dart:ffi';

//Criando a classe Livro
class Livro {
  //Atributos
  final int id;
  final String titulo;
  final String autor;
  final String sinopse;
  final List<String> categoria;
  final String capa;
  final String editora;
  final String isbn;
  final Double preco;

  //Construtor
  Livro(
      {required this.id,
      required this.titulo,
      required this.autor,
      required this.sinopse,
      required this.categoria,
      required this.capa,
      required this.editora,
      required this.isbn,
      required this.preco});

  //Criação da MAP para listar os meus valores em forma de chave valor
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'sinopse': sinopse,
      'categoria': categoria,
      'capa': capa,
      'editora': editora,
      'isbn': isbn,
      'preco': preco
    };
  }

  //Usado para construir um objeto da classe Livro
  factory Livro.fromJson(Map<String, dynamic> e) {
    return Livro(
      id: e['id'],
      titulo: e['titulo'],
      autor: e['autor'],
      sinopse: e['sinopse'],
      categoria: e['categoria'],
      capa: e['capa'],
      editora: e['editora'],
      isbn: e['isbn'],
      preco: e['preco'],
    );
  }
}
