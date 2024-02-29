class Animal {
  //Atributos
  String _especie;
  String _urlFoto;
  String _urlAudio;

  //Metodos
  //Construtor
  Animal(this._especie, this._urlFoto, this._urlAudio) {}

//Criação de Getters and Setters
  String get especie => _especie;
  String get urlFoto => _urlFoto;
  String get urlAudio => _urlAudio;

  set setEspecie(String especie) {
    setEspecie = especie;
  }

  set setUrlFoto(String urlFoto) {
    setUrlFoto = urlFoto;
  }

  set setUrlAudio(String urlAudio) {
    setUrlAudio = urlAudio;
  }
}
