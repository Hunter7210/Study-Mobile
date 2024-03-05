// Criando classe para conteros elementos

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: [
          Text(
            "Exemplo1",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1), fontSize: (20.0)),
          ),
          Text(
            "Exemplo2",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "Testando",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
      color: Color.fromRGBO(0, 0, 0, 1),
      height: 150.0,
      width: MediaQuery.of(context).size.width * 0.8,
    ));
  }
}
