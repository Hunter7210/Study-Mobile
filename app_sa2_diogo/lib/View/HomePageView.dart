import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  String email;
  //Passando o atributo dentro do contrutor
  PaginaHome({super.key, required this.email});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  late SharedPreferences
      _prefs; // Preferências compartilhadas para armazenar o estado do tema escuro
  bool _darkMode = false; // Estado atual do tema escuro
  String email;
  String _idioma = "pt-br";

  _PaginaHomeState({required this.email});

  @override
  void initState() {
    super.initState();
    _loadPreferences(); // Carrega as preferências compartilhadas ao iniciar a tela
  }

//Salvar no shared_preferences
  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ??
          false; // Assim vamos criar uma chave unica para o darmode, basicamente nó estamos concatenando o nosso email a configuração darkmode, sendo assim ele junta o meu email com o valor da minha chave booleana(no caso), sendo assim unica.//email é a minha primary key
      _idioma = _prefs.getString('${email}_idioma') ?? 'pt-br';
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode; // Inverte o estado do tema escuro
    });
    await _prefs.setBool('${email}_darkMode',
        _darkMode); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  Future<void> _toggleLanguage(String value) async {
    //Assincrono me permite se retornar um erro ele não vai parar o meu programa
    setState(() {
      _idioma = value; //Pode adicionar uma API para mudança de idioma
    });
    await _prefs.setString('${email}_idioma',
        _idioma); // Salva o estado do tema escuro nas preferências compartilhadas
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Define o tema com base no modo escuro
      duration:
          const Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Armazenamento Interno'), // Título da barra de aplicativos
        ),
        body: Center(
          child: Column(
            children: [
              Switch(
                value:
                    _darkMode, // Valor do interruptor baseado no estado atual do tema escuro
                onChanged: (value) {
                  _toggleDarkMode(); // Chama a função para alternar o tema escuro
                },
              ),
              const Text("Selecione o Idioma"),
              DropdownButton<String>(
                value: _idioma,
                onChanged: (value) {
                  _toggleLanguage(value.toString());
                },
                items: const <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'pt-br',
                    child: Text('Português (Brasil)'),
                  ),
                  DropdownMenuItem(
                    value: 'en-us',
                    child: Text('Inglês (EUA)'),
                  ),
                  DropdownMenuItem(
                    value: 'es-ar',
                    child: Text('Espanhol (Argentina)'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
