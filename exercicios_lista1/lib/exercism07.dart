import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Drawer"),
      ),
      drawer: Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text("Welcome to Drawer",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "PAGINA1",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.access_time),
              tooltip: 'test',
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("SNACKBAR")));
              },
              color: Colors.white,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "PAGINA1",
              style: TextStyle(color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.access_time),
              tooltip: 'test',
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("SNACKBAR")));
              },
              color: Colors.white,
            ),
          ]),
        ]),
        backgroundColor: Color.fromARGB(218, 0, 0, 0),
      ),
      body: Center(
        child: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: Text('Abrir Drawer'),
          ),
        ),
      ),
    );
  }
}
