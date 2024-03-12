import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(Icons.zoom_out_outlined), Text("TITULO")],
        ),
        actions: <Widget>[
          Column(children: [
            Row(children: [
              IconButton(
                icon: const Icon(Icons.access_time),
                tooltip: 'test',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("SNACKBAR")));
                },
              ),
              Icon(Icons.abc)
            ]),
            Row(children: [
              IconButton(
                icon: const Icon(Icons.access_time),
                tooltip: 'test',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("SNACKBAR1")));
                },
              ),
              Icon(Icons.abc),
            ]),
          ])
        ],
        backgroundColor: Color.fromARGB(255, 219, 82, 2),
        toolbarHeight: 80,
      ),
    );
  }
}
