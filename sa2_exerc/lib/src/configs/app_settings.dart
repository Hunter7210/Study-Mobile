// preferences.dart

// Importe as bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Crie uma classe para gerenciar as preferências do usuário
class UserPreferences {
  // Método para obter o tamanho da fonte salvo nas preferências
  static Future<double> getFontSize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('fontSize') ??
        16.0; // Retorna 16.0 se não houver valor salvo
  }

  // Método para obter a cor do AppBar salva nas preferências
  static Future<Color> getAppBarColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int colorValue = prefs.getInt('appBarColor') ??
        Colors.blue.value; // Retorna azul se não houver valor salvo
    return Color(colorValue);
  }

  // Método para obter o ícone salvo nas preferências
  static Future<IconData> getIconNotify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String iconName = prefs.getString('iconNotify') ??
        "notifications"; // Nome padrão do ícone
    return iconNameToIconData(iconName);
  }

  // Método auxiliar para converter o nome do ícone em IconData
  static IconData iconNameToIconData(String iconName) {
    switch (iconName) {
      case 'add':
        return Icons.add;
      case 'remove':
        return Icons.remove;
      case 'notifications':
        return Icons.notifications;
      default:
        return Icons.notifications; // Ícone padrão
    }
  }

  // Método para salvar o tamanho da fonte nas preferências
  static Future<void> setFontSize(double fontSize) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
  }

  // Método para salvar a cor do AppBar nas preferências
  static Future<void> setAppBarColor(Color appBarColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('appBarColor', appBarColor.value);
  }

  // Método para salvar o ícone nas preferências
  static Future<void> setIconNotify(String iconName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('iconNotify', iconName);
  }
}
