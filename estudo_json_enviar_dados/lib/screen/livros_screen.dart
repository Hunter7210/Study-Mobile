//NESTA PAGINA, MOSTRAMOS UMA PAGINA ONDE INSERIMOS DADOS AO JSON, E TAMBEM RECUPERAMOS ESTES VALORES EM FORMATO DE TABELA, POREM A LISTAGEM AINDA NÃO FOI FEITA DE FORMA AUTOMATICA
import 'package:estudo_json_enviar_dados/model/livros.dart';
import 'package:estudo_json_enviar_dados/services/livros_service.dart';
import 'package:flutter/material.dart';

class LivrosScreen extends StatefulWidget {
  const LivrosScreen({super.key});

  @override
  State<LivrosScreen> createState() => _LivrosScreenState();
}

class _LivrosScreenState extends State<LivrosScreen> {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _autor = TextEditingController();
  bool _alugado = false;
  Future<Livros>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data Example'),
      ),
      body: Column(
        //INSERIR A RESPOSTA
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
          Row(
            children: [
              const Text('Alugado'),
              Switch(
                value: _alugado,
                onChanged: (value) {
                  setState(() {
                    _alugado = value;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                LivrosService ls = LivrosService();
                _futureAlbum =
                    ls.createLivros(_titulo.text, _autor.text, _alugado);

                print(_titulo.text);
                print(_autor.text);
                print(_alugado);
              });
            },
            child: const Text('Create Data'),
          ),
        ],
      ),
    );
  }
/* 
  //Criação do metodo para Exbir os dados na tela
  FutureBuilder<Livros> buildFutureBuilder() {
    return FutureBuilder<Livros>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Titulo')),
                DataColumn(label: Text('Autor')),
                DataColumn(label: Text('Disponibilidde')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text(_titulo.text)),
                    DataCell(Text(_autor.text)),
                    DataCell(Text(_alugado.toString())),
                  ],
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
    */
}
