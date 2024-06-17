import 'package:flutter/material.dart';
import 'package:estudo_json_enviar_dados/services/livros_service.dart';
import 'package:estudo_json_enviar_dados/model/livros.dart';

class LivrosListScreen extends StatefulWidget {
  @override
  _LivrosListScreenState createState() => _LivrosListScreenState();
}

class _LivrosListScreenState extends State<LivrosListScreen> {
  final LivrosService _livrosService = LivrosService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Livros'),
      ),
      body: FutureBuilder<List<Livros>>(
        future: _livrosService.getAllLivros(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum livro encontrado.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Livros livro = snapshot.data![index];
                return ListTile(
                  title: Text(livro.titulo),
                  subtitle: Text(livro.autor),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await _livrosService.deleteLivro(livro.id);
                      setState(() {});
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
