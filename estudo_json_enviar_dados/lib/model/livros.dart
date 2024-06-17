//Criação do model

class Livros {
  final int id;
  final String titulo;
  final String autor;
  final String condicao;
  final String valor;
  final bool disponivel;

  const Livros({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.condicao,
    required this.valor,
    required this.disponivel,
  });

  factory Livros.fromJson(Map<String, dynamic> json) {
    // Este switch é um switch case
    return switch (json) {
      {
        //  Ele procura um mapa que tenha as chaves 'id','titulo'etc, e espera que os valores associados sejam do tipo int,String etc
        'id': int id,
        'titulo': String titulo,
        'autor': String autor,
        'condicao': String condicao,
        'valor': String valor,
        'disponivel': bool disponivel,
      } =>
        Livros(
            id: id,
            titulo: titulo,
            autor: autor,
            condicao: condicao,
            valor: valor,
            disponivel: disponivel),
      //Este "_" é o meu default do switch case, no caso me retornando um erro
      _ => throw const FormatException('Falha ao carregar o álbum.'),
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'condicao': condicao,
      'valor': valor,
      'disponivel': disponivel,
    };
  }
}
