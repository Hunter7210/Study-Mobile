class MusicModel {
  final String title;
  final String artist;
  final String url;
  final String color;
  final String album;

  //colocar depois, image, nome_autor, categoria etc

  MusicModel({
    required this.title,
    required this.artist,
    required this.url,
    required this.color,
    required this.album,
  });

//Neste caso só iremos receber a musica, não iremos enviar ou cadastrar alguma
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      color: json['color'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      url: json['url'],
    );
  }
}
