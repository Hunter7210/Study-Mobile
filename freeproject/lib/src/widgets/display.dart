import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  final String value;
  const Display({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          value,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
