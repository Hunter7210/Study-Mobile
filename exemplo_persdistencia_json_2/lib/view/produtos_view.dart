import 'package:exemplo_persdistencia_json_2/controller/produto_controller.dart';
import 'package:exemplo_persdistencia_json_2/view/produto_info_view.dart';
import 'package:flutter/material.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  ProdutosController controller = ProdutosController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista Produtos"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Expanded(
            child: FutureBuilder(
                future: controller.loadProdutos(),
                builder: (context, snapshot) {
                  if (controller.produtos.isNotEmpty) {
                    return ListView.builder(
                      itemCount: controller.produtos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.produtos[index].nome),
                          subtitle: Text(controller.produtos[index].categoria),
                          trailing: Image.asset(controller.produtos[index].url),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProdutoInfoPage(
                                    produto: controller.produtos[index]),
                              )),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ));
  }
}
