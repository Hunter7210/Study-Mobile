import 'package:exemplo_interface/exemplo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Onde eu vou rodar o App
void main() {
  runApp(MyApp());
}

//Classe que será responsável por montar a minha pagina
class MyApp extends StatelessWidget {
  //Método responsável pela contrução
  @override
  Widget build(BuildContext context) {
    //Minha Pagina deve ser contruída dentro disto
    return MaterialApp(
      //Minha Pagina é composta por isto, é basicamente a minha tag <HTML>
      home: Scaffold(
        appBar: AppBar(
          title: Text("Teste"),
        ),
        body: Column(
          children: [
            Text("INFO:"),
            Column(
              children: [
                Row(
                    // children: [Text("Nome:")",Icon()" ,Text("Pessoa2")],
                    ),
                Row(
                  children: [Text("Idade"), Text("12")],
                ),
                Row(
                  children: [Text("Endereco:"), Text("R. Lugar Nenhum")],
                ),
                Row(
                  children: [Text("Telefone:"), Text("199xxx-xxxx")],
                ),
                Row(
                  children: [Text("Email:"), Text("pessoa2@gmail.com")],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
