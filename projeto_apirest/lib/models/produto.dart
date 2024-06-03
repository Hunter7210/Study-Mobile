class Produto {
  //Atributos
  final int id;
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
      id: json['id'],
      nome: json['nome'],
      preco: json['preco'],
    );
  } //From JSON
}
