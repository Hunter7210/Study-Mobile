class UsersModel {
  int id;
  String nome;
  String email;
  String telefone;
  String celular;
  String cep;
  int numero;
  String sexo;

  //Criando o construtor
  UsersModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.celular,
    required this.cep,
    required this.numero,
    required this.sexo,
  });

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nome,
      'email': email,
      'telefone': telefone,
      'celular': celular,
      'cep': cep,
      'numero': numero,
      'sexo': sexo,
    };
  }

  // Método de fábrica para criar um objeto UsersModel a partir de um mapa (para ler do banco de dados)
  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'],
      nome: map['name'],
      email: map['email'],
      telefone: map['phone'],
      celular: map['addressLine1'],
      cep: map['addressLine1'],
      numero: map['addressLine1'],
      sexo: map['addressLine1'],
    );
  }
}
