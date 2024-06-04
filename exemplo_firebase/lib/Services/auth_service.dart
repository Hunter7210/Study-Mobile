import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Classe de autenticação

  //construir o login do usuario
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //login usuario
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      //Usando o firebase facilita na criação do projeto, sem a necessidade de se preocupar com abir concexões etc
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //create a new user
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logout do usuario
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
