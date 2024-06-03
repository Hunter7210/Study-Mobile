class Produto {
  //Atributos
  final String id;
  final String nome;
  final double preco;

  //Construtor
  Produto({required this.id, required this.nome, required this.preco});

  //Criação do TOJSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'].toString(),
      nome: json['nome'].toString(),
      preco: json['preco'] is double
          ? json['preco']
          : double.parse(json['preco']).toDouble(),
    );
  } //From JSON
}
