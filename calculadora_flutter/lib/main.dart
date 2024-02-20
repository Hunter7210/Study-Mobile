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
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = ''; //String em "" ou ''

  void _calcular(String operacao) {
    //
    double numero1 = double.tryParse(_controllerNumero1.text) ??
        0.0; //Pegando o texto do controllerNumero1 e passa para double
    double numero2 = double.tryParse(_controllerNumero2.text) ??
        0.0; //?? é o formato do valor a ser chamado
    double? resultado;

    setState(() {
      //SetState ação, onde contem os
      if (operacao == "Somar") {
        resultado = numero1 + numero2;
      } else if (operacao == 'Sub') {
        resultado = numero1 - numero2;
      } else if (operacao == "Mult") {
        resultado = numero1 * numero2;
      } else if (operacao == "Div") {
        resultado = numero2 != 0
            ? numero1 / numero2
            : resultado =
                null; //Nada mais é do que um if usando um operador ternário
      } else if (operacao == "Pot") {
        resultado = numero1 != 0
            ? pow(numero1, numero2) as double
            : resultado = 1; //as double, pois ele especifica a forma de retorno
      } else {
        resultado = numero2 % 2 == 1 && numero1 >= 0
            ? -pow(-numero1, (1 / numero2)) as double
            : resultado = null;
      }
      _resultado =
          resultado != null ? 'O Resultado é $resultado' : "Operação inválida";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
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
              decoration: InputDecoration(labelText: 'Número 1'), //Placeholder
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular(
                  'Somar'), //onPressed = evento; Ao pressionar o botão ele atribuí a calcular o valor "Soma"
              child: Text('Somar'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Sub'),
              child: Text('Subtrair'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _calcular('Mult'),
              child: Text('Multiplicação'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Div'),
              child: Text('Divisao'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Pot'),
              child: Text('Potência'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Raiz'),
              child: Text('Raiz'),
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
