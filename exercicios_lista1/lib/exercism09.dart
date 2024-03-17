import 'package:flutter/material.dart';

class Exercism09 extends StatelessWidget {
  //Visual
  @override
  Widget build(BuildContext context) {
    // Criação para cntrole da Tabbar
    return DefaultTabController(
        initialIndex: 2,
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Teste"),
            bottom: const TabBar(tabs: <Widget>[
              //Definindo o titulo de cada aba
              Tab(icon: Icon(Icons.abc)),
              Tab(icon: Icon(Icons.access_alarm_outlined)),
              Tab(child: Text("Pode ser Assim"))
            ]),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(child: Text("TAB1")),
              Padding(padding: EdgeInsets.all(100.0), child: Text("TAB2")),
              Center(child: Text("TAB3")),
            ],
          ),
        ));
  }
}
