import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppSettingsLang extends ChangeNotifier {
  String _locale = 'pt_BR';
  String _currencySymbol = 'R\$';

  String get locale => _locale;
  String get currencySymbol => _currencySymbol;

  void setLocale(String locale, String currencySymbol) {
    _locale = locale;
    _currencySymbol = currencySymbol;
    notifyListeners();
  }

  String formatCurrency(double value) {
    final format =
        NumberFormat.currency(locale: _locale, symbol: _currencySymbol);
    return format.format(value);
  }
}
