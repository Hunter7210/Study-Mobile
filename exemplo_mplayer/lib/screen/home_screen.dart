import 'package:exemplo_mplayer/screen/music_player_screen.dart';
import 'package:exemplo_mplayer/services/music_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MusicServices _musicService = MusicServices();

  Future<void> _musicList() async {
    try {
      await _musicService.featchListMusic();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Music Player'),
      ),
      body: //future.builder,
          Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: _musicList(),
                  builder: (context, snapshot) {
                    if (_musicService.listMusic.isNotEmpty) {
                      return ListView.builder(
                        itemCount: _musicService.listMusic.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_musicService.listMusic[index].title),
                            subtitle: Column(
                              children: [
                                Text(_musicService.listMusic[index].url),
                                Text(_musicService.listMusic[index].color),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MusicPlayerScreen(
                                        music: _musicService.listMusic[index])),
                              );
                            },
                          );
                        },
                      );
                    } else if (_musicService.listMusic.isEmpty) {
                      return const Center(
                        child: Text('Não há músicas cadastradas'),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
