//Criação do model

class Livros {
  final String id;
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

  factory Livros.fromJson(Map<String, dynamic> json) {
    // Este switch é um switch case
    return Livros(
      id: json['id'] ?? '123',
      titulo: json['titulo'] ?? 'titulo',
      autor: json['autor'] ?? 'autor',
      condicao: json['condicao'] ?? 'condicao',
      valor: json['valor'] ?? 'valor',
      disponivel: json['disponivel'] ?? false,
    );
  }
}
