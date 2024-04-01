import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5.0,
                blurRadius: 7.0,
                offset: Offset(0.0, 3.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.blueGrey.shade200,
                    ),
                  ),
                  hintText: 'Usuário',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.blueGrey.shade200,
                    ),
                  ),
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Login'),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class _CadastroPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Celular'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            DropdownButtonFormField(
              value: 'Masculino',
              items: [
                'Masculino',
                'Feminino',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String value) {},
            ),
            ElevatedButton(onPressed: () {}, child: Text("Enviar"))
          ],
        ),
      ),
    );
  }
}
