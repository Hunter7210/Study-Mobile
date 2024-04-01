class UsersModel {
  int id;
  String nome;
  String email;
  String telefone;
  String celular;
  String endereco;
  String sexo;

  //Criando o construtor
  UsersModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.celular,
    required this.endereco,
    required this.sexo,
  });
}
