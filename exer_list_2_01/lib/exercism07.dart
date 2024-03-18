import 'package:flutter/material.dart';

class Exercism07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utilização do Stack"),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        fit: StackFit.loose,
        children: [
          Positioned(
            child: Container(
              color: Colors.amber,
              height: 300.0,
              width: 300.0,
            ),
          ),
          Positioned(
            left: 15,
            child: Container(
              color: Colors.red,
              height: 300.0,
              width: 300.0,
            ),
          ),
          Positioned(
            left: 30,
            child: Container(
              color: Colors.blue,
              height: 300.0,
              width: 300.0,
            ),
          ),
          Positioned(
            left: 45,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ESTA É A ABA 4"),
                ],
              ),
              color: Color.fromARGB(255, 10, 209, 50),
              height: 300.0,
              width: 300.0,
            ),
          )
        ],
      ),
    );
  }
}
