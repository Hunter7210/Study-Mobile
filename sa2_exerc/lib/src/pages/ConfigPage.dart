import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sa2_exerc/src/configs/app_settings.dart';
import 'package:sa2_exerc/src/configs/number_format.dart';

class ConfigPage extends StatefulWidget {
  _PreferencUserPage createState() => _PreferencUserPage();
}

class _PreferencUserPage extends State<ConfigPage> {
  bool isDarkTheme = false;
  bool _switchValue2 = false;

  var iconsEsco = Icons.dark_mode;
  bool iconVerifyDark = false;

  late NumberFormat real;
  late Map<String, String> loc;

/*   @override
  void initState() {
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    readNumerFormat() {
      String loc = context.watch<AppSettingsLang>().locale;
      print(loc); // Saída: R$ 1.234,56

      // real = NumberFormat.currency(locale: loc['locale'], symbol: loc['name']);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch com Ícones'),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          changeLanguageButton(),
          IconButton(
            onPressed: () {
              iconsEsco =
                  !iconVerifyDark == true ? Icons.dark_mode : Icons.light_mode;
            },
            icon: Icon(iconsEsco),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.public),
            tooltip: 'Mundo',
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: ListTile(
/*                   leading: Icon(Icons.swap_vert), */
                  title: Text("Usar: R\$ "),
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
              title: const Text('Switch 2'),
              value: _switchValue2,
              onChanged: (bool value) {
                setState(() {
                  _switchValue2 = value;
                });
              },
              secondary: const Icon(Icons.ac_unit),
            ),
          ],
        ),
      ),
    );
  }

  changeLanguageButton() {
    final locale = loc['locale'] == 'pt_BR' ? 'en_Us' : 'pt_BR';
    final name = loc['locale'] == 'pt_BR' ? '\$' : 'R\$';

    return PopupMenuButton(
      icon: Icon(Icons.swap_vert_outlined),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.swap_vert),
            title: Text('Usar: $locale'),
            onTap: () {
              context.read<AppSettingsLang>().setLocale(locale, name);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
