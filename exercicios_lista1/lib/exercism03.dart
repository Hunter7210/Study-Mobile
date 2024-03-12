import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Exercism03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(100),
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(255, 0, 6, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(255, 198, 199, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(245, 131, 0, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(208, 255, 0, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(123, 255, 0, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(88, 219, 13, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(0, 255, 85, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(22, 26, 27, 1),
          height: 60,
        ),
        Container(
          margin: EdgeInsets.all(3),
          child: Column(
            children: [
              Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                "Subtitulo",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          color: Color.fromRGBO(0, 110, 255, 1),
          height: 60,
        ),
      ],
      scrollDirection: Axis.vertical,
    );
  }
}
