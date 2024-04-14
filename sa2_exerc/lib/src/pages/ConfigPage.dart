import 'package:flutter/material.dart';
import 'dart:core';

import 'package:sa2_exerc/src/Database/DataBaseController.dart';
import 'package:sa2_exerc/src/configs/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  _PreferencUserPage createState() => _PreferencUserPage();
}

class _PreferencUserPage extends State<ConfigPage> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro

/*   double _fontSize = 16.0; // Tamanho da fonte padrão
  Color _appBarColor = Colors.blue; // Cor padrão do AppBa
 */
  IconData iconeClaro = Icons.light_mode;
  IconData iconeEscuro = Icons.dark_mode;

  bool iconVerifyDark = false;

  bool _iconVerifyNotify = false;

  bool _darkMode = false; // Estado atual do tema escuro

  DatabaseHelper dbh = DatabaseHelper();

  // Método chamado quando o estado é inicializado
  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências do usuário ao inicializar
  }

  // Método para carregar as preferências do usuário
  _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('darkMode') ??
          false; // Obtém o estado atual do tema escuro ou define como falso se não houver valor

      _iconVerifyNotify = _prefs.getBool('iconVerifyNotify') ??
          false; // Obtém o tamanho da fonte salvo
/*     _appBarColor = await UserPreferences.getAppBarColor();
     =
        await UserPreferences.getIconNotify(); // Obtém a cor do AppBar salvas */
    });
  } // Atualiza a UI após carregar as preferências

  Future<void> saveUserPreferences(UserPreferences preferences) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', preferences.userId);
    await prefs.setString('themeMode', preferences.themeMode);
    await prefs.setBool(
        'notificationsEnabled', preferences.notificationsEnabled);
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _toggleIconNotify() async {
    setState(() {
      _iconVerifyNotify =
          !_iconVerifyNotify; // Inverte o estado do tema escuro_iconVerifyNotify);
    });
    print(_iconVerifyNotify);
    await _prefs.setBool('iconVerifyNotify',
        _iconVerifyNotify); // Salva o estado do tema escuro nas preferências compartilhadas
  }

/*   // Método para salvar as preferências do usuário
  _savePreferences() async {
    await UserPreferences.setFontSize(_fontSize); // Salva o tamanho da fonte
    await UserPreferences.setAppBarColor(_appBarColor); // Salva a cor do AppBar
    // Salva o nome do ícone, não o ícone em si
    await UserPreferences.setIconNotify(_iconsNoti.codePoint.toString());
  } */

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Define o tema com base no modo escuro
      duration:
          const Duration(milliseconds: 100), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor:
              const Color.fromARGB(255, 4, 64, 112), // Define a cor do AppBar
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _toggleDarkMode(); // Chama a função para alternar o tema escuro
              },
              icon: Icon(_darkMode ? iconeEscuro : iconeClaro),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.language),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.lte_mobiledata),
                    title: const Text('PT/BR'),
                    onTap: () {
                      const PopupMenuItem(
                        child: ListTile(
                          title: Text('Notificações'),
                        ),
                      );
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.abc),
                    title: const Text('EN'),
                    onTap: () {
                      const PopupMenuItem(
                        child: ListTile(
                          title: Text('Notificações'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            PopupMenuButton(
              icon: const Icon(Icons.settings),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: const Text('Notificações'),
                    onTap: () {
                      _toggleIconNotify();
                      if (!_iconVerifyNotify) {
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
                      Navigator.of(context).pop(); // Fecha o PopupMenu
                    },
                    leading: Icon(_iconVerifyNotify
                        ? Icons.notifications
                        : Icons.notifications_off),
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
                value:
                    _darkMode, // Valor do interruptor baseado no estado atual do tema escuro
                onChanged: (value) {
                  _toggleDarkMode(); // Chama a função para alternar o tema escuro
                  /* _savePreferences(); */
                  _loadPreferences();
                },
                secondary: Icon(_darkMode ? iconeEscuro : iconeClaro),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
