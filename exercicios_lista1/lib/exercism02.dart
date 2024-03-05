import 'package:flutter/material.dart';

class Exercism02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text("Texto cima"), Image.asset('../img/santos.png')],
      ),
    );
  }
}
