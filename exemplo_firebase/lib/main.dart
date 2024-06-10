import 'package:exemplo_firebase/Screen/home_screen.dart';
import 'package:exemplo_firebase/Screen/login_screen.dart';
import 'package:exemplo_firebase/Screen/register_screen.dart';
import 'package:exemplo_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/registro': (context) => const RegistroScreen()
      },
    );
  }
}
