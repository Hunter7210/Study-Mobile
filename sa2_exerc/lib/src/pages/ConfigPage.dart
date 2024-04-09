import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sa2_exerc/src/configs/app_settings.dart';

class ConfigPage extends StatefulWidget {
  @override
  _PreferencUserPage createState() => _PreferencUserPage();
}

class _PreferencUserPage extends State<ConfigPage> {
  IconData iconeClaro = Icons.light_mode;
  IconData iconeEscuro = Icons.dark_mode;

  bool isDarkTheme = false;

  var iconsEsco = Icons.dark_mode;
  bool iconVerifyDark = false;

  bool _temaEscuro = false; // Altere o nome da variável para melhor clareza

  late Locale locale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch com Ícones'),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              iconsEsco =
                  !iconVerifyDark == true ? Icons.dark_mode : Icons.light_mode;
            },
            icon: Icon(iconsEsco),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.settings),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notificações'),
                  onTap: () {
                    // Navegue para a página de configurações de notificação
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: const Text('Personalização'),
                  onTap: () {
                    // Navegue para a página de personalização da interface
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              title: const Text('Tema Escuro'),
              value: _temaEscuro,
              onChanged: (bool value) {
                setState(() {
                  _temaEscuro = value;
                });
              },
              secondary: Icon(_temaEscuro ? iconeEscuro : iconeClaro),
            ),
          ],
        ),
      ),
    );
  }
}
