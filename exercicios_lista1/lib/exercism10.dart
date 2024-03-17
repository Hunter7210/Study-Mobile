import 'package:flutter/material.dart';

class Exercism10 extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<Exercism10> {
  double _width = 100.0; // Largura inicial do container
  double _height = 100.0; // Altura inicial do container
  Color _color = Color.fromRGBO(3, 20, 255, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Um detector de gestos que detecta toques no container
      onTap: () {
        // Quando o container é tocado...
        setState(() {
          // Atualiza o estado do widget
          // Ao clicar, altera as dimensões do container
          _width = _width * 1.0; // Alterna entre 100 e 200
          _height = _height + 10.0; // Alterna entre 100 e 200

          _color = Color.fromRGBO(255, 0, 0, 1);
        });
      },

      onLongPress: () {
        setState(() {
          _width = 100.0;
          _height = 100.0;
          _color = Color.fromRGBO(3, 20, 255, 1);
        });
      },
      child: AnimatedContainer(
        // Um container que anima suas mudanças de propriedade
        duration: Duration(
            milliseconds: 500), // Define a duração da animação (meio segundo)
        width: _width, // Largura do container
        height: _height, // Altura do container
        color: _color,
        // Cor de fundo do container

        curve: Curves
            .easeInOut, // A curva de animação define a forma como a animação é executada (suavização)
      ),
    );
  }
}
