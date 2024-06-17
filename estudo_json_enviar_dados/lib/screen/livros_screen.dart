import 'package:estudo_json_enviar_dados/model/livros.dart';
import 'package:estudo_json_enviar_dados/screen/listar_livros_screen.dart';
import 'package:estudo_json_enviar_dados/services/livros_service.dart';
import 'package:flutter/material.dart';

class LivrosScreen extends StatefulWidget {
  const LivrosScreen({Key? key}) : super(key: key);

  @override
  State<LivrosScreen> createState() => _LivrosScreenState();
}

class _LivrosScreenState extends State<LivrosScreen> {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _autor = TextEditingController();
  final TextEditingController _valor = TextEditingController();
  bool _disponivel = false;

  String? _condicao;
  final List<String> _options = ['Novo', 'Semi-Novo', 'Usado'];

  Future<Livros>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titulo,
              decoration: const InputDecoration(hintText: 'Titulo'),
            ),
            TextField(
              controller: _autor,
              decoration: const InputDecoration(hintText: 'Autor'),
            ),
            TextField(
              controller: _valor,
              decoration: const InputDecoration(hintText: 'Valor'),
            ),
            const Text("Condição"),
            DropdownButton<String>(
              hint: const Text('Selecione um opção'),
              value: _condicao,
              onChanged: (String? newValue) {
                setState(() {
                  _condicao = newValue;
                });
              },
              items: _options.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            Row(
              children: [
                const Text('Indisponivel'),
                Switch(
                  value: _disponivel,
                  onChanged: (value) {
                    setState(() {
                      _disponivel = value;
                    });
                  },
                ),
                const Text('Disponivel'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (mounted) {
                  setState(
                    () {
                      LivrosService ls = LivrosService();
                      _futureAlbum = ls.createLivros(
                        _titulo.text,
                        _autor.text,
                        _condicao.toString(),
                        _valor.text,
                        _disponivel,
                      );

                      print(_titulo.text);
                      print(_autor.text);
                      print(_condicao);
                      print(_valor);
                      print(_disponivel);
                    },
                  );
                }
              },
              child: const Text('Create Data'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LivrosListScreen()),
                );
              },
              child: const Text('Listar Livros'),
            ),
          ],
        ),
      ),
    );
  }
}
