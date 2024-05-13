import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:exem_persis_json/model/produtos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nomecontroller = TextEditingController();
  final TextEditingController _precocontroller = TextEditingController();
  final TextEditingController _categoriacontroller = TextEditingController();

  List<Produto> _produtos = [];
  @override
  void initState() {
    super.initState();
    _loadProdutos();
  }

  void _loadProdutos() async {
    final data = await rootBundle.loadString('assets/produtos.json');
    final jsonList = json.decode(data) as List<dynamic>;
    setState(() {
      _produtos = jsonList
          .map((e) => Produto(
              nome: e['nome'], preco: e['preco'], categoria: e['categoria']))
          .toList();
    });
  }

  Future<void> _saveProdutos() async {
    final appDocDir = await getAplicationDocumentsDirectory();
    final filePath = '${appDocDir.path}/produto.json';
    final jsonList = _produtos.map((produto) => produto.toJson());
    await File(filePath).writeAsString(json.encode(jsonList));  
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
