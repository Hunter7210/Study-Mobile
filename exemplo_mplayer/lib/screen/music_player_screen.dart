import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_mplayer/models/music_model.dart'; // Importa a classe MusicModel
import 'package:flutter/material.dart'; // Importa os widgets do Material Design do Flutter

class MusicPlayerScreen extends StatefulWidget {
  final MusicModel
      music; // Propriedade para armazenar a instância de MusicModel
  const MusicPlayerScreen({Key? key, required this.music})
      : super(key: key); // Construtor

  @override
  State<MusicPlayerScreen> createState() =>
      _MusicPlayerScreenState(); // Cria o estado para o widget
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final _audio = AudioPlayer(); // Instância do AudioPlayer
  bool _isPlaying =
      false; // Variável de estado para controlar se a música está tocando ou não

  @override
  void initState() {
    super.initState();
    // Inicializa o estado do widget
    if (_isPlaying) {
      _audio.stop(); // Para a reprodução se já estiver tocando
    } else {
      _audio.play(UrlSource(
          widget.music.url)); // Toca a música a partir da URL no MusicModel
    }

    // Escuta as mudanças no estado do player (tocando, pausado, parado)
    _audio.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.playing) {
        setState(() {
          _isPlaying =
              true; // Atualiza o estado para indicar que a música está tocando
        });
      } else {
        setState(() {
          _isPlaying =
              false; // Atualiza o estado para indicar que a música não está tocando
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        _parseColor(widget.music.color); // Função para converter a cor
    print(backgroundColor);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title), // Exibe o título da música na app bar
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Image.network(
                  widget.music.album), // Exibe a capa do álbum da música

              // Linha para os controles de reprodução
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _audio.seek(
                        const Duration(seconds: -10),
                      ); // Retrocede 10 segundos
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_left),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_isPlaying) {
                        _audio.pause(); // Pausa a música se estiver tocando
                      } else {
                        _audio.resume(); // Resume a música se estiver pausada
                      }
                    },
                    icon: Icon(_isPlaying
                        ? Icons.pause
                        : Icons
                            .play_arrow), // Exibe o ícone de play/pause com base no estado de reprodução
                  ),
                  IconButton(
                    onPressed: () {
                      _audio.seek(
                        const Duration(seconds: 100),
                      ); // Avança 10 segundos
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_right),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _parseColor(String hexColor) {
    if (hexColor.length != 7 || hexColor[0] != '#') {
      return Colors.black; // Cor padrão se inválida
    }

    return Color(int.parse(hexColor.substring(1, 7), radix: 16));
  }

  @override
  void dispose() {
    _audio
        .release(); // Libera os recursos usados pelo AudioPlayer quando o widget é descartado
    super.dispose();
  }
}
