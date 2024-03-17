import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Básico"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(90.0),
              child: Text(
                "Layout Extremamente Básico demonstrando o alinhamento",
                style: TextStyle(
                    fontSize: 30.0,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Container(
              child: Container(
                child: Icon(Icons.abc),
              ),
              height: 120.0,
              width: 120.0,
              color: Colors.orange,
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.radar,
                    size: 90.0,
                  ),
                  Icon(
                    Icons.face,
                    size: 90.0,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              color: Colors.deepOrange,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        color: const Color.fromARGB(255, 53, 61, 65),
      ),
    );
  }
}
