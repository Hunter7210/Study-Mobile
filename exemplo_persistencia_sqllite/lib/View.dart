import 'package:exemplo_persistencia_sqllite/DataBaseController.dart';
import 'package:exemplo_persistencia_sqllite/Model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dbHelper = DatabaseHelper();

    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: FutureBuilder<List<ContactModel>>(
        future: dbHelper
            .getContacts(), // Obtém a lista de contatos do banco de dados
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Exibe um indicador de carregamento enquanto os dados estão sendo carregados
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Exibe uma mensagem de erro se ocorrer um erro ao carregar os dados
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
                    'No contacts found.')); // Exibe uma mensagem se não houver contatos encontrados
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data?[index];
                return ListTile(
                  title: Text(contact!.name),
                  subtitle: Text(contact.email),
                  onTap: () {
                    // Implement onTap functionality
                  },
                );
              },
            ); // Exibe a lista de contatos
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addContact(
            context,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addContact(
    BuildContext context,
  ) async {
    TextEditingController _idcontroller = TextEditingController();
    TextEditingController _nomecontroller = TextEditingController();
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _phonecontroller = TextEditingController();
    TextEditingController _addressLine1controller = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Preencha os campos"),
          content: Column(
            children: [
              TextField(
                controller: _nomecontroller,
                decoration: InputDecoration(hintText: "Digite o nome:"),
              ),
              TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(hintText: "Digite o nome:"),
              ),
              TextField(
                controller: _phonecontroller,
                decoration: InputDecoration(hintText: "Digite o nome:"),
              ),
              TextField(
                controller: _addressLine1controller,
                decoration: InputDecoration(hintText: "Digite o nome:"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text('Atualizar'),
            ),
            TextButton(
              onPressed: () {
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
