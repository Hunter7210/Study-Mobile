import 'dart:convert'; // Importa a biblioteca para trabalhar com codificação e decodificação de dados JSON
import 'package:flutter/material.dart'; // Importa o material design do Flutter
import 'package:http/http.dart'
    as http; // Importa o pacote http para fazer requisições HTTP

void main() {
  runApp(MyApp()); // Inicia a aplicação Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Função para obter dados da API via método GET
  Future<String> getData() async {
    var response = await http.get(Uri.parse(
        'https://api.example.com/data')); // Faz a requisição GET para a API

    if (response.statusCode == 200) {
      // Verifica se a requisição foi bem-sucedida
      return response.body; // Retorna o corpo da resposta (os dados)
    } else {
      throw Exception(
          'Failed to load data'); // Lança uma exceção se a requisição falhar
    }
  }

  // Função para enviar dados para a API via método POST
  Future<String> postData() async {
    var response = await http.post(
      Uri.parse(
          'https://api.example.com/post'), // Faz a requisição POST para a API
      body: {
        'key': 'value'
      }, // Define os dados a serem enviados no corpo da requisição
    );

    if (response.statusCode == 200) {
      // Verifica se a requisição foi bem-sucedida
      return response.body; // Retorna o corpo da resposta (os dados)
    } else {
      throw Exception(
          'Failed to post data'); // Lança uma exceção se a requisição falhar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Example'), // Define o título da barra de aplicativos
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                getData().then((value) {
                  print(value); // Imprime os dados recebidos da API no console
                });
              },
              child: Text('GET Data'), // Define o texto do botão
            ),
            ElevatedButton(
              onPressed: () {
                postData().then((value) {
                  print(
                      value); // Imprime os dados recebidos da API após enviar os dados via POST
                });
              },
              child: Text('POST Data'), // Define o texto do botão
            ),
          ],
        ),
      ),
    );
  }
}
