import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercism06 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uso de Drawer"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(1)),
                color: Color.fromARGB(255, 148, 148, 148),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Then close the drawer
                /*  Navigator.pop(context); */
              },
            ),
            ListTile(
              title: const Text('Cadastro'),
              onTap: () {
                // Then close the drawer
                /*      Navigator.pop(context); */
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
