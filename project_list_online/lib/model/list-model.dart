class tarefas_model {
  final int id;
  final String taks;

  Tarefas_Model({required this.id, required this.taks});

  factory Tarefas_Model.fromJson(Map<String, dynamic> json) {
    return Tarefas_Model(
      id: json['id'],
      taks: json['task'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': taks,
    };
  }
}
