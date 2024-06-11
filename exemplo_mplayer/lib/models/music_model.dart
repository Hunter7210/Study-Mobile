class MusicModel {
  final String title;
  final String artist;
  final String url;
  final String color;

  //colocar depois, image, nome_autor, categoria etc

  MusicModel(
      {required this.title,
      required this.artist,
      required this.url,
      required this.color});

//Neste caso só iremos receber a musica, não iremos enviar ou cadastrar alguma
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      color: json['color'],
      title: json['title'],
      artist: json['artist'],
      url: json['url'],
    );
  }
}
