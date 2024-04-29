import 'package:exemplo_persdistencia_json_2/model/produtos_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProdutoInfoPage extends StatelessWidget {
  Produto produto;
  ProdutoInfoPage({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produto info'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(produto.nome),
            // ignore: prefer_interpolation_to_compose_strings
            Text('Preco: ${produto.preco}'),
            Text(produto.categoria),
            Image.asset(
              produto.url,
              fit: Border.all(color: Colors.amber, style: BorderStyle.solid),
            )
          ],
        ),
      ),
    );
  }
}
