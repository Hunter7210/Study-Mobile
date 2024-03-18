import 'package:flutter/material.dart';

class Exercism05 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Determina a largura da tela
    double screenWidth = mediaQueryData.size.width;

    // Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.05;

    double heightSize = screenWidth * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Responsivo'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Title(
              color: Colors.black,
              child: Text(
                "Cadastre-se",
                style: TextStyle(fontSize: textSize),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: heightSize),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: heightSize),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Numero',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: heightSize),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: heightSize),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                side: BorderSide(
                    color: const Color.fromARGB(255, 97, 97, 97), width: 5),
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Text("Enviou");
              },
              child: Text("Enviar"),
            ),
          ),
        ],
      ),
    );
  }
}
