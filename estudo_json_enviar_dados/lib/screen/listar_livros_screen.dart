import 'package:estudo_json_enviar_dados/model/livros.dart';
import 'package:estudo_json_enviar_dados/services/livros_service.dart';
import 'package:flutter/material.dart';

class ListarLivros extends StatefulWidget {
  const ListarLivros({super.key});

  @override
  State<ListarLivros> createState() => _ListarLivrosState();
}

class _ListarLivrosState extends State<ListarLivros> {
  late Future<List<Livros>> _livrosFuture;

  @override
  void initState() {
    super.initState();
    _livrosFuture = LivrosService().getAllLivros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Livros'),
      ),
      body: FutureBuilder<List<Livros>>(
        future: _livrosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Livros livro = snapshot.data![index];
                return ListTile(
                  title: Text(livro.titulo),
                  subtitle: Text(livro.autor),
                  trailing: Text('R\$ ${livro.valor}'),
                );
              },
            );
          } else {
            return const Center(child: Text('Nenhum livro encontrado'));
          }
        },
      ),
    );
  }
}
