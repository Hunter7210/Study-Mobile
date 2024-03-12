import 'package:flutter/material.dart';

class Exercism06 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double screenWidth = mediaQueryData.size.width;

    double textSize = screenWidth * 0.05;
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Cadastro"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Nome:",
              style:
                  TextStyle(fontSize: textSize, fontWeight: FontWeight.normal),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Insira seu nome',
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.2),
            Text(
              "Idade:",
              style:
                  TextStyle(fontSize: textSize, fontWeight: FontWeight.normal),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Insira sua idade',
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.2),
            Text(
              "Altura:",
              style:
                  TextStyle(fontSize: textSize, fontWeight: FontWeight.normal),
            ),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Insira sua altura (em metros)',
              ),
            ),
            SizedBox(height: 20, width: screenWidth * 0.2),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a lógica para processar os dados do formulário
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
