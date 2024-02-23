//Responsavel por transformar todos os outros modulos em uma aplicação
//Perite fazer a navegação entre as paginas

import 'package:app_lista2/ListaProdutosControler.dart';
import 'package:app_lista2/ListaProdutosView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaProdutosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Definindo a tela inicial como a ListaTarefasS
      home: ChangeNotifierProvider(
        create: (context) => ListaProdutosControler(),
        child: ListaProdutosView(),
      ),
    );
  }
}
