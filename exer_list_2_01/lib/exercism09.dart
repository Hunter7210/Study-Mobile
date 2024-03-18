import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism09 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Personalização de Botões"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Text("ElevateButton"),
          Row(children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.construction_outlined),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Enviar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 20.0),
              ),
            )
          ]),
          Text("TextButton"),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Clique aqui!"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 20.0),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Teste"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
          Text("OutlinedButton"),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text("Pressione"),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 20.0),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text("Botão1"),
                style: OutlinedButton.styleFrom(
                  // Cor do texto
                  textStyle: TextStyle(fontSize: 20), // Estilo do texto
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Espaçamento interno
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Borda arredondada
                    side: BorderSide(
                        color: Colors.blue), // Borda ao redor do botão),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
