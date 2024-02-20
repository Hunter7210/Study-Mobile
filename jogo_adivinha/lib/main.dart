import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  //Criação de um objeto
  TextEditingController _controllerNumero1 = TextEditingController();

  String _resultado = ''; //String em "" ou ''

  void _calcular(String operacao) {
    Random random = new Random();
    int gerad = random.nextInt(100);
    double numero1 = double.tryParse(_controllerNumero1.text) ??
        0.0; //Pegando o texto do controllerNumero1 e passa para double
    double? resultado;
    int contad = 0;

    bool venceu = true;

    setState(() {
      while (venceu == true) {
        if (numero1 == gerad) {
          //Você ganhou
          _resultado = "Você ganhou; Você acertou em $contad tentativas: ";
          venceu = false;
        } else if (numero1 < gerad) {
          //Seu valor esta baixo
          _resultado = "Seu valor esta baixo";
        } else if (numero1 > gerad) {
          //Diminua o valor
          _resultado = "Seu valor esta muito alto";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo adivinhação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number, //Para escrever numeros
              decoration: InputDecoration(labelText: 'Numero 1'), //Placeholder
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular(
                  'Somar'), //onPressed = evento; Ao pressionar o botão ele atribuí a calcular o valor "Soma"
              child: Text('Testar'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Sub'),
              child: Text('Resetar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
