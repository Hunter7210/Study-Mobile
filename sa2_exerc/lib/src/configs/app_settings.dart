import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences _prefs;
  Map<String, String> locale = {
    'locale': 'pt/BR',
    'name': 'R\$',
  };

//Contrutor
  AppSettings() {
    //Necessária criação deste metodo, pois o construtor não pode ser assincrono
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  //Metodo para inicializar as minha preferencuias
  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

//Metodo para ler as preferencias e notificar os listeners
  _readLocale() {
    final local = _prefs.getString('local') ??
        'pt_BR'; //Significa que se o valor for nulo ele é considerado como 'pt_BR'; "?? Significa ou"
    final name = _prefs.getString('name') ?? 'R\$';

//Chamando chave valor
    locale = {
      'locale': local,
      'name': name,
    };
    notifyListeners();
  }

//Metodo publico para que o usuario possa alter esses campos em qualquer logar do app
  setLocale(String local, String name) async {
    await _prefs.setString('local', local);
    await _prefs.setString('name', name);
    await _readLocale();
  }
}
