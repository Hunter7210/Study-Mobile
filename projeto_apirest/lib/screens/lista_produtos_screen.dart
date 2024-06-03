import 'package:flutter/material.dart';
import 'package:projeto_apirest/controllers/produtos_controller.dart';
import 'package:projeto_apirest/models/produto.dart';

class ListaProdutosScreen extends StatefulWidget {
  const ListaProdutosScreen({super.key});

  @override
  State<ListaProdutosScreen> createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  final ProdutosController _controller = ProdutosController();

  Future<List<Produto>> futureProdutos() async {
    try {
      return _controller.getProdutosFromJson();
    } catch (e) {
      print(e);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Lista"),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
