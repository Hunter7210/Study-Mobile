import 'package:app_animais/model.dart';

class AnimalController {
  //Atributos
  //Criação de uma lista se baseando na classe animal
  List<Animal> _listAnimal = [];

  //GET DA LISTA
  List get listarAnimais => _listAnimal;

  //Criação de um metodo para adicionar animal
  void adicionarAnimal(String especie, String urlFoto, String urlAudio) {
    Animal novoAnimal = Animal(especie, urlFoto, urlAudio);
    _listAnimal.add(novoAnimal);
  }

  void excluirAnimal() {}

  void atualiAnimal() {}
}
