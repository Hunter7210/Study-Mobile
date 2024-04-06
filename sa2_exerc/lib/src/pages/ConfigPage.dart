import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/Database/DataBaseController.dart';
import 'package:sa2_exerc/src/models/Model.dart';
import 'package:sa2_exerc/src/pages/CadastroPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPage extends StatefulWidget {
  @override
  _PreferencUserPage createState() => _PreferencUserPage();
}

class _PreferencUserPage extends State<ConfigPage> {
  bool isDarkTheme = false;
  bool _switchValue2 = false;

  var tema = Icons.dark_mode;

  @override
  void initState() {
    super.initState();
    _carregarPreferencias();
  }

  Future<void> _salvarPreferencias(bool isDarkTheme, bool switchValue2) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDarkTheme);
    await prefs.setBool('switchValue2', switchValue2);
  }

  Future<void> _carregarPreferencias() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
      _switchValue2 = prefs.getBool('switchValue2') ?? false;
      tema = isDarkTheme ? Icons.light_mode_outlined : Icons.dark_mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch com Ícones'),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.light_mode_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.swap_vert_outlined)),
          IconButton(
            icon: Icon(Icons.public),
            tooltip: 'Mundo',
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              title: Text("Tema"),
              value: isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  isDarkTheme = false;
                  tema =
                      isDarkTheme ? Icons.light_mode_outlined : Icons.dark_mode;
                  _salvarPreferencias(isDarkTheme, _switchValue2);
                });
              },
              secondary: Icon(tema),
            ),
            SwitchListTile(
              title: const Text('Switch 2'),
              value: _switchValue2,
              onChanged: (bool value) {
                setState(() {
                  _switchValue2 = value;
                  _salvarPreferencias(isDarkTheme, _switchValue2);
                });
              },
              secondary: const Icon(Icons.ac_unit),
            ),
          ],
        ),
      ),
    );
  }
}
