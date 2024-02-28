//Criando a parte visual do projeto

import 'package:app_lista2/ListaProdutosControler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaProdutosView extends StatelessWidget {
  //Criando o responsavel por controlar o campo de inserir texto
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar novo produto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Novo Produto',
                // Ícone para adicionar um produto ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    _showConfirmationDialog(context);
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de produtos usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaProdutosControler>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.produtos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.produtos[index].descricao),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Ícone de atualizar
                          IconButton(
                            icon: Icon(Icons.update),
                            onPressed: () {
                              _alertAtuali(context, model, index);
                            },
                          ),
                          // Checkbox para marcar o produto como comprado
                          Checkbox(
                            value: model.produtos[index].concluida,
                            onChanged: (value) {
                              model.marcarComoComprado(index);
                            },
                          ),
                        ],
                      ),
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        model.excluirProduto(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) async {
    bool confirmado = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text("Deseja realmente adicionar produto?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Sim'),
            ),
          ],
        );
      },
    );

    if (confirmado == true) {
      _listarProduto(context);
      // Limpar o campo de texto após adicionar a tarefa
      _controller.clear();
      _alertConfirma(context);
    }
  }

  void _alertConfirma(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Você adicionou um produto"),
          content: Text('O produto ' +
              _controller.text +
              ' foi adicionado a sua lista de compras'),
          actions: <Widget>[
            //Este é o botão que aparecera no meu alert, Exemplo: Fechar, Atualizar etc
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Fecha o AlertDialog quando o botão é pressionado
              },
              child: Text('Fechar'), // Define o texto do botão como "Fechar"
            ),
          ],
        );
      },
    );
  }

  void _alertAtuali(
      BuildContext context, ListaProdutosControler model, int index) async {
    TextEditingController _updateController = TextEditingController();
    _updateController.text = model.produtos[index].descricao;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atualizar Produto"),
          content: TextField(
            controller: _updateController,
            decoration: InputDecoration(hintText: "Escreva aqui:"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                model.atualizaProduto(model.produtos[index].descricao, index,
                    _updateController.text);
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

  void _listarProduto(BuildContext context) async {
    // Chamando o método adicionarProduto do Provider para atualizar o estado
    return Provider.of<ListaProdutosControler>(context, listen: false)
        .adicionarProdutos(_controller.text);
  }
}
