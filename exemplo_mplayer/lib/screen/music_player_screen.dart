import 'package:audioplayers/audioplayers.dart';
import 'package:exemplo_mplayer/models/music_model.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  final MusicModel music;
  const MusicPlayerScreen({Key? key, required this.music}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final _audio = AudioPlayer();
  bool _isPlaying = false; 

  @override
  void initState() {
    super.initState();
    if (_isPlaying) {
      _audio.stop();
    } else {
      _audio.play(UrlSource(widget.music.url));
    }
    _audio.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.playing) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.music.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Image.network(widget.music.album);

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _audio.seek(
                        const Duration(seconds: -10),
                      );
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_left),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_isPlaying) {
                        _audio.pause();
                      } else {
                        _audio.resume();
                      }
                    },
                    icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {
                      _audio.seek(
                        const Duration(seconds: 10),
                      );
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

  @override
  void dispose() {
    _audio.release();
    super.dispose();
  }
}
