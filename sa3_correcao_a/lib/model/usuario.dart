class Usuario {
  //atributos
  late int
      id; //Assim o id, suporta o valor nulo, nos possibilitando realizar o SERIAL
  String nome;
  String email;
  String senha;

  //Construtor
  Usuario({required this.nome, required this.email, required this.senha});

  Map<String,
          dynamic> //dynamic permite colocar qualquer tipo de variavel, o Map<NOME DA COLUNA, NOME DA VARIAVEL>
      toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

//Criação de uma factory, pois ele ira me possibilitar transformar meus dados em objetos, é bom todos os projetos onde ira ter entradas de dados possuir uma factory para armazenar estes valores
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
        nome: map['nome'],
        email: map['email'],
        senha: map[
            'senha']); //Caso queira realizar as pesquisas pelo id, adicione map['id'], e adicione o required no construtor, required id
  }
}
