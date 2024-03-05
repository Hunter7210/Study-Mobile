import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.blueGrey,
            child: Image.network(
                'https://imgs.search.brave.com/M1bXmgOD9lE4jMwaOfmSQdG9cJcyT56667S4zcPpC_w/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy90/aHVtYi8zLzM1L1Nh/bnRvc19sb2dvLnN2/Zy8yMjBweC1TYW50/b3NfbG9nby5zdmcu/cG5n'),
          ),
          Row(
            children: [
              Text(
                "Esquerda",
                style: TextStyle(fontSize: 30.0),
              ),
              Column(
                children: [
                  Text("Cima"),
                  Container(
                    child: Text("Meio"),
                    alignment: Alignment.center,
                    height: 180.0,
                    width: 200.0,
                    color: Colors.indigoAccent,
                  ),
                  Text("Baixo")
                ],
              ),
              Text("Direita"),
            ],
          )
        ],
      ),
      width: 100.0,
      height: 80.0,
      color: Colors.black12,
    );
  }
}
