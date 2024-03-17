import 'package:flutter/material.dart';

class Exercism08 extends StatelessWidget {
  //Criação de um modelo da classe Card, para facilitar o preenchimento dos cards
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'), // Define o título da barra de navegação
      ),
      body: ListView(
        // Cria uma lista vertical
        children: <Widget>[
          ProductCard(
            imagePath: 'lib/assets/volkswagen-tiguan-2-0-350-tsi.png',
            productName: 'Tiguan', // Nome do produto
            productPrice: '\$188.000', // Preço do produto
            productDescription:
                '*** CARRO IMPECÁVEL *** MEGA BEM CUIDADO *** BLINDAGEM NÍVEL III-A COMPLETA, TETRA *** GARANTIA DA BLINDAGEM DE 10 ANOS *** TEMOS FINANCIAMENTO Outros Opcionais: Farol de neblina, Direção Elétrica, Comando de áudio no volante, Banco bi-partido, Controle de estabilidade, Distribuição eletrônica de frenagem, Kit Multimídia, Pára-choques na cor do veículo.', // Descrição do produto
          ),
          ProductCard(
            imagePath: 'lib/img/volkswagen-taos-1.4-250-tsi.jpg',
            productName: 'TAOS',
            productPrice: '\$161.999',
            productDescription:
                'A procura de um VolksWagen TAOS - Branco - seminovo? Aqui tem. Gostou deste carro? Temos uma equipe de atendimento on-line pronta para te atender. Tire todas suas dúvidas de forma rápida e descomplicada, entrando em contato conosco, ou se preferir, faça uma visita, estamos te esperando!',
          ),
          ProductCard(
            imagePath: 'lib/img/volkswagen-tcross-1.4-250-tsi.jpg',
            productName: 'T-CROSS',
            productPrice: '\$120.999',
            productDescription:
                'Se você está buscando um novo carro, não se arrisque e compre na Localiza Seminovos: carros com 360 itens verificados, garantia e procedência. Aqui você encontra a maior variedade de modelos do mercado, condições únicas de financiamento, entrada facilitada em até 10 vezes sem juros, carros revisados e com garantia de quilometragem real. Viabilizamos a troca do seu carro usado e entregamos seu novo carro na segurança de sua casa! Agende já seu atendimento.',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName; // Nome do produto
  final String productPrice; // Preço do produto
  final String productDescription; // Descrição do produto
  final String imagePath; // Caminho da imagem do produto

  ProductCard({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Cria um card para exibir informações do produto
      margin: EdgeInsets.all(10.0), // Define a margem do card
      child: Padding(
        padding: EdgeInsets.all(15.0), // Adiciona preenchimento interno ao card
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha o conteúdo à esquerda
          children: <Widget>[
            Image.asset(
              // Adiciona uma imagem ao card
              imagePath, // Caminho da imagem
              fit: BoxFit
                  .cover, // Ajusta a imagem para preencher o espaço disponível
              width: double
                  .infinity, // Define a largura da imagem para ocupar toda a largura do card
              height: 150.0, // Define a altura da imagem
            ),
            Text(
              productName, // Exibe o nome do produto
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0), // Adiciona espaço entre os widgets
            Text(
              productPrice, // Exibe o preço do produto
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.green, // Define a cor do texto
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              productDescription, // Exibe a descrição do produto
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

  // Entendo o funcionamento do widget Card de forma simples

 /*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utilizando o widget Card"),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "TOUAREG",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "RS 199.000",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Carro com procedencia e garantia. Pneus semi-novos. Blingadem Nivel 3 Aceitamos trocas perante avaliação. Obs. Para cliente fora do estado de Goiás, favor entrar em contato antes para saber como funciona a questão do IPVA. Nos reservamos ao direito de alterações sem prévio aviso e também correção de erros. Expert - Revenda e Consultoria Automotiva.",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  } 
}
*/  
