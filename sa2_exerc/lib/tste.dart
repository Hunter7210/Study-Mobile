// main.dart

// Importe as bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:sa2_exerc/src/configs/app_settings.dart';
// Importe o arquivo de gerenciamento de preferências

// Função principal que inicializa o aplicativo
void main() {
  runApp(MyApp());
}

// Classe MyApp, que é o widget raiz do aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PreferencesPage(), // Define a página inicial como PreferencesPage
    );
  }
}

// Classe PreferencesPage, que é a página onde o usuário pode configurar suas preferências
class PreferencesPage extends StatefulWidget {
  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

// Estado da página de preferências
class _PreferencesPageState extends State<PreferencesPage> {
  double _fontSize = 16.0; // Tamanho da fonte padrão
  Color _appBarColor = Colors.blue; // Cor padrão do AppBar

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
    _appBarColor =
        await UserPreferences.getAppBarColor(); // Obtém a cor do AppBar salva
    setState(() {}); // Atualiza a UI após carregar as preferências
  }

  // Método para salvar as preferências do usuário
  _savePreferences() async {
    await UserPreferences.setFontSize(_fontSize); // Salva o tamanho da fonte
    await UserPreferences.setAppBarColor(_appBarColor); // Salva a cor do AppBar
  }

  // Método de construção da UI da página de preferências
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences Example'),
        backgroundColor: _appBarColor, // Define a cor do AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selecione o tamanho da fonte:',
              style: TextStyle(fontSize: 18.0),
            ),
            Slider(
              value: _fontSize,
              min: 10.0,
              max: 30.0,
              onChanged: (value) {
                setState(() {
                  _fontSize =
                      value; // Atualiza o tamanho da fonte ao mover o slider
                });
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Selecione a cor do AppBar:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Wrap(
              children: <Widget>[
                _buildColorButton(Colors.blue),
                _buildColorButton(Colors.red),
                _buildColorButton(Colors.green),
                _buildColorButton(Colors.purple),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _savePreferences, // Chama o método para salvar as preferências ao pressionar o botão
        tooltip: 'Salvar',
        child: Icon(Icons.save),
      ),
    );
  }

  // Método para construir botões de seleção de cor
  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _appBarColor =
              color; // Atualiza a cor do AppBar ao selecionar um botão de cor
        });
      },
      child: Container(
        width: 50,
        height: 50,
        color: color,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
      ),
    );
  }
}
