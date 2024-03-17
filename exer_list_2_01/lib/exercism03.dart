import 'package:flutter/material.dart';

class Exercism03 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Exercism03> {
  int _selectedIndex = 0;

  // Lista de widgets para cada página
  List<Widget> _widgetOptions = <Widget>[
    Text('Página 1'),
    Text('Página 2'),
    Text('Página 3'),
  ];

  // Método para trocar de página
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//Criação Visual
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de navegação'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Página 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Página 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Página 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
