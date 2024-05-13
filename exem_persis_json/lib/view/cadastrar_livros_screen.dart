import 'package:flutter/material.dart';

class CadastrarLivroScreen extends StatefulWidget {
  const CadastrarLivroScreen({super.key});

  @override
  State<CadastrarLivroScreen> createState() => _CadastrarLivroScreenState();
}

class _CadastrarLivroScreenState extends State<CadastrarLivroScreen> {
  // Controladores para os campos de texto
  final tituloController = TextEditingController();
  final autorController = TextEditingController();
  final sinopseController = TextEditingController();
  final capaController = TextEditingController();
  final editoraController = TextEditingController();
  final isbnController = TextEditingController();
  final precoController = TextEditingController();

  // Variável para armazenar a categoria selecionada
  String? categoriaSelecionada;

  // Lista de categorias para o Dropdown
  final List<String> categorias = [
    'Ficção',
    'Não-ficção',
    'Educativo',
    'Biografia',
    // Adicione mais categorias conforme necessário
  ];

  // Função para validar os campos de texto
  String? validarTexto(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo não pode ser vazio';
    }
    return null; // Retorna null se o valor for válido
  }

  // Função para validar o ISBN com REGEX
  String? validarISBN(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o ISBN do livro';
    }
    // REGEX para ISBN-10 ou ISBN-13
    final isbnPattern = RegExp(
        r'^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$');
    if (!isbnPattern.hasMatch(value)) {
      return 'Por favor, insira um ISBN válido';
    }
    return null; // Retorna null se o valor for válido
  }

// Função para validar o preço com REGEX
  String? validarPreco(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o preço do livro';
    }
    // REGEX para validar se é um número decimal
    final precoPattern = RegExp(r'^\d+(\.\d+)?$');
    if (!precoPattern.hasMatch(value)) {
      return 'Por favor, insira um valor de preço válido';
    }
    return null; // Retorna null se o valor for válido
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) {
                  validarTexto(value);
                },
              ),
              TextFormField(
                controller: autorController,
                decoration: const InputDecoration(labelText: 'Autor'),
                validator: (value) {
                  validarTexto(value);
                },
              ),
              TextFormField(
                controller: sinopseController,
                decoration: const InputDecoration(labelText: 'Sinopse'),
              ),
              DropdownButtonFormField(
                value: categoriaSelecionada,
                onSaved: (newValue) {
                  categoriaSelecionada = newValue;
                },
                onChanged: (newValue) {
                  setState(() {
                    categoriaSelecionada = newValue;
                  });
                },
                items: categorias.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Categoria'),
              ),
              TextFormField(
                controller: capaController,
                decoration: const InputDecoration(labelText: 'Capa'),
                validator: (value) {
                  validarTexto(value);
                },
              ),
              TextFormField(
                controller: editoraController,
                decoration: const InputDecoration(labelText: 'Editora'),
                validator: (value) {
                  validarTexto(value);
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: isbnController,
                      decoration: const InputDecoration(labelText: 'ISBN'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        validarISBN(value);
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0), // Espaço entre os campos
                  Expanded(
                    child: TextFormField(
                      controller: precoController,
                      decoration: const InputDecoration(labelText: 'Preço'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        validarPreco(value);
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Implemente a lógica para criar um objeto LivroCadastro e salvá-lo
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
