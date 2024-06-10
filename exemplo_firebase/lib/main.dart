import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:exemplo_firebase/Screen/home_screen.dart';
import 'package:exemplo_firebase/Screen/list_data_screen.dart';
import 'package:exemplo_firebase/Screen/login_screen.dart';
import 'package:exemplo_firebase/Screen/register_screen.dart';
import 'package:exemplo_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/registro': (context) => const RegistroScreen(),
        '/list': (context) => const ListDataScreen(userId: 'user_id_here'),
      },
    );
  }
}
