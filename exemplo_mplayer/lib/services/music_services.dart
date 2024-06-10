import 'dart:convert';

import 'package:exemplo_mplayer/models/music_model.dart';
import 'package:http/http.dart' as http;

class MusicServices {
  //Serve para conectar o json

  final Uri url = "http://URL_JSON.com";

  List<MusicModel> _listMusic = [];
  List<MusicModel> get listMusic => _listMusic;

  //featch lista  de musicas
  Future<List<MusicModel>> featchListMusic() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _listMusic = json
          .decode(response.body)
          .map<MusicModel>((item) => MusicModel.fromJson(item))
          .toList();
    } else {
      return Future.error(response.statusCode.toString());
    }
    return _listMusic;
  }
}
