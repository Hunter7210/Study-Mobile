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
                    // Chamando o método adicionarProduto do Provider para atualizar o estado
                    Provider.of<ListaProdutosControler>(context, listen: false)
                        .adicionarProdutos(_controller.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
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
                      // Exibição do texto do produto
                      title: Text(model.produtos[index].descricao),
                      // Checkbox para marcar o produto como comprado
                      trailing: Checkbox(
                        value: model.produtos[index].concluida,
                        onChanged: (value) {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoComprado(index);
                        },
                      ),
                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirProduto do Provider para atualizar o estado
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
}
