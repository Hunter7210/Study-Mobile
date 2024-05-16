class Tarefa {
  // Definindo meus atributos
  late int id;
  String nome;
  bool concluida;

//Criando o construtor
  Tarefa({required this.nome, required this.concluida, required id});

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'concluida': concluida};
  }

//Criação de uma factory, pois ele ira me possibilitar transformar meus dados em objetos, é bom todos os projetos onde ira ter entradas de dados possuir uma factory para armazenar estes valores
  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
        id: map['id'],
        nome: map['nome'],
        concluida: map[
            'concluida']); //Caso queira realizar as pesquisas pelo id, adicione map['id'], e adicione o required no construtor, required id
  }
}
