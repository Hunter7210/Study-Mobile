import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';

import 'package:sa2_exerc/src/Database/DataBaseController.dart';
import 'package:sa2_exerc/src/configs/app_settings.dart';

class ConfigPage extends StatefulWidget {
  @override
  _PreferencUserPage createState() => _PreferencUserPage();
}

class _PreferencUserPage extends State<ConfigPage> {
  double _fontSize = 16.0; // Tamanho da fonte padrão
  Color _appBarColor = Colors.blue; // Cor padrão do AppBa

  IconData iconeClaro = Icons.light_mode;
  IconData iconeEscuro = Icons.dark_mode;

  var iconsEsco = Icons.dark_mode;
  bool iconVerifyDark = false;

  IconData _iconsNoti = Icons.notifications_off_sharp;
  bool iconVerifyNotify = false;

  bool _temaEscuro = false; // Altere o nome da variável para melhor clareza

  late Locale locale;

  DatabaseHelper dbh = DatabaseHelper();

  // Método chamado quando o estado é inicializado
  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências do usuário ao inicializar
  }

  // Método para carregar as preferências do usuário
  _loadPreferences() async {
    _fontSize =
        await UserPreferences.getFontSize(); // Obtém o tamanho da fonte salvo
    _appBarColor = await UserPreferences.getAppBarColor();
    _iconsNoti =
        await UserPreferences.getIconNotify(); // Obtém a cor do AppBar salva
    setState(() {}); // Atualiza a UI após carregar as preferências
  }

  // Método para salvar as preferências do usuário
  _savePreferences() async {
    await UserPreferences.setFontSize(_fontSize); // Salva o tamanho da fonte
    await UserPreferences.setAppBarColor(_appBarColor); // Salva a cor do AppBar
    // Salva o nome do ícone, não o ícone em si
    await UserPreferences.setIconNotify(
        _iconsNoti.codePoint.toString()); // Salva a cor do AppBar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch com Ícones'),
        backgroundColor: _appBarColor, // Define a cor do AppBar
        actions: <Widget>[
          IconButton(
            onPressed: () {
              iconsEsco =
                  !iconVerifyDark == true ? Icons.dark_mode : Icons.light_mode;
              _savePreferences();
            },
            icon: Icon(iconsEsco),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.settings),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(_iconsNoti),
                  title: const Text('Notificações'),
                  onTap: () {
                    setState(() {
                      _iconsNoti = _iconsNoti == Icons.notifications
                          ? Icons.notifications_off
                          : Icons.notifications;
                      _savePreferences();
                      if (_iconsNoti != Icons.notifications) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Notificações silenciadas!'),
                            backgroundColor: Colors.blueGrey,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Notificações ativadas!'),
                            backgroundColor: Colors.blueGrey,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    });
                    // Salva a preferência imediatamente
                    Navigator.of(context).pop();

                    // Fecha o PopupMenu
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  onTap: () {
                    _savePreferences();
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
                _savePreferences();
              },
              secondary: Icon(_temaEscuro ? iconeEscuro : iconeClaro),
            ),
          ],
        ),
      ),
    );
  }
}
