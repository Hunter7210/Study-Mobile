import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism05 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Formulário Cadastro"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Text("Nome:"),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Insira seu nome',
                    border: OutlineInputBorder(),
                  ),
                )
              ]),
              Row(children: [
                Text("Idade: "),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Insira seu nome',
                    border: OutlineInputBorder(),
                  ),
                )
              ]),
              Row(children: [
                Text("Altura: "),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Insira seu nome',
                    border: OutlineInputBorder(),
                  ),
                )
              ]),
            ],
          ),
        ));
  }
}
