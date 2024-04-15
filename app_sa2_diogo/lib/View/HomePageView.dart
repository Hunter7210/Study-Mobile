import 'package:flutter/material.dart';

class PaginaHome extends StatefulWidget {
  //Passando o atributo dentro do contrutor
  PaginaHome({super.key, required this.email});
  String email;

  @override
  State<PaginaHome> createState() => _PaginaHomeState();
}

class _PaginaHomeState extends State<PaginaHome> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
