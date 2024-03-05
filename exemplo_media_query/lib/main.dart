import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Obtém informações sobre o ambiente de exibição
    MediaQueryData mediaQueryData = MediaQuery.of(context);

// Determina a largura da tela
    double screenWidth = mediaQueryData.size.width;

// Calcula o tamanho do texto com base na largura da tela
    double textSize = screenWidth * 0.05;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo MediaQuery'),
        ),
        body: Center(
          child: Container(
            width: screenWidth * 0.6,
            padding: EdgeInsets.only(),
            color: Color.fromARGB(255, 137, 0, 250),
            child: Text(
              'Texto Responsivo',
              style: TextStyle(fontSize: textSize),
              textAlign: TextAlign.end,
              selectionColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
