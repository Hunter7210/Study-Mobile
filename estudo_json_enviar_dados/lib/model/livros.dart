//Criação do model
class Livros {
  final int id;
  final String titulo;
  final String autor;
  final bool alugado;

  const Livros({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.alugado,
  });

  factory Livros.fromJson(Map<String, dynamic> json) {
    // Este switch é um switch case
    return switch (json) {
      {
        //  Ele procura um mapa que tenha as chaves 'id','titulo'etc, e espera que os valores associados sejam do tipo int,String etc
        'id': int id,
        'titulo': String titulo,
        'autor': String autor,
        'alugado': bool alugado
      } =>
        Livros(id: id, titulo: titulo, autor: autor, alugado: alugado),
      //Este "_" é o meu default do switch case, no caso me retornando um erro
      _ => throw const FormatException('Falha ao carregar o álbum.'),
    };
  }
}
