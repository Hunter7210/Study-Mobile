class MusicModel {
  final String title;
  final String url;
  //colocar depois, image, nome_autor, categoria etc

  //construtor
  MusicModel({required this.title, required this.url});

//Neste caso só iremos receber a musica, não iremos enviar ou cadastrar alguma
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      title: json['title'],
      url: json['url'],
    );
  }
}
