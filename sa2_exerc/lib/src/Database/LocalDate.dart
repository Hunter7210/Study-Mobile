import 'package:shared_preferences/shared_preferences.dart';

const chave = 'dark';

class LocalDate {
  static salvarString(String valor) async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    shared.setString(chave, valor);
  }

  //Funções de get
}
