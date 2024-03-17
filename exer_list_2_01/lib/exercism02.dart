import 'package:flutter/material.dart';

class Exercism02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista dinâmica"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: 10,
        //Construção do Card
        itemBuilder: (BuildContext context, int index) {
          return Card(
            // Cria um card para exibir informações do produto
            margin: EdgeInsets.all(10.0), // Define a margem do card
            child: Padding(
              padding: EdgeInsets.all(
                  15.0), // Adiciona preenchimento interno ao card
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alinha o conteúdo à esquerda
                children: <Widget>[
                  Icon(
                    Icons.face_2_rounded,
                    size: 100.0, // Define a altura da imagem
                  ),
                  Text(
                    "Produto", // Exibe o nome do produto
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0), // Adiciona espaço entre os widgets
                  Text(
                    "Preco", // Exibe o preço do produto
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green, // Define a cor do texto
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Descrição", // Exibe a descrição do produto
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
