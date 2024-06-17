import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemplo_firebase/models/todolist.dart';

class TodolistController {
  List<Todolist> _list = [];
  List<Todolist> get list => _list;

  // Instância do Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para adicionar um item na lista do Firestore
  Future<void> add(Todolist todo) async {
    await _firestore.collection('todolist').add(todo.toMap());
  }

  // Método para deletar um item da lista do Firestore baseado no ID
  Future<void> delete(String id) async {
    await _firestore.collection('todolist').doc(id).delete();
  }

  // Método para listar todos os itens da lista do Firestore baseado no userID
  Future<List<Todolist>> fetchList(String userId) async {
    // Consulta ao Firestore para buscar os documentos da coleção 'todolist'
    // onde o campo 'userId' seja igual a userId, ordenados pelo campo 'timestamp' em ordem descendente
    final QuerySnapshot result = await _firestore
        .collection('todolist')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    List<dynamic> convert = result.docs as List;
    // Mapeando os documentos retornados para objetos Todolist usando o método fromJson da classe Todolist
    _list =
        convert.map((doc) => Todolist.fromJson(doc.data(), doc.id)).toList();

    // Retornando a lista de Todolists
    return _list;
  }
}
