class Produto {
  //Atributos
  final String
      nome; //final é usada para declarar uma constante, normalmente usada para variveis
  final int preco;
  final String categoria;
  final String url;

  //Construtor
  const Produto(
      //const é usada para declarar uma constante, normalmente usada para metodos
      {required this.nome,
      required this.preco,
      required this.categoria,
      required this.url});
  //Métodos
  //Para interação com JSON usar MAP

  Map<String, dynamic> toJson() {
    //toJson é o nome do meu metodo
    //Map é uma lista que não tem indice, ou seja, não ha posição; Ao inves de chamar o indice chama a chave do seu valor
    //O primeiro valor é relacionado ao nome da minha categoria la n JSON, o segundo valor é refernte a ao meu construtor
    return {'nome': nome, 'preco': preco, 'categoria': categoria, 'foto': url};
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    //A factory me permite criar um obj da classe produto, com os valores do meu JSON, basicamente como um GET, pegando os valores do JSON e atribuino a cada chave o seu devido valor
    return Produto(
        nome: json['nome'],
        preco: json['preco'],
        categoria: json['categoria'],
        url: json['foto']);
  }
}
