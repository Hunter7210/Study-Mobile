class UsersModel {
  String nome;
  String email;
  String telefone;
  String sexo;
  String cep;
  String senha;

  //Criando o construtor
  UsersModel({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.sexo,
    required this.cep,
    required this.senha,
  });

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'sexo': sexo,
      'cep': cep,
      'senha': senha,
    };
  }

  // Método de fábrica para criar um objeto UsersModel a partir de um mapa (para ler do banco de dados)
  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      nome: map['nome'],
      email: map['email'],
      telefone: map['telefone'],
      sexo: map['sexo'],
      cep: map['cep'],
      senha: map['senha'],
    );
  }
}
