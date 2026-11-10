class RecordUsuario {
  final String id;
  final String nome;
  final String email;
  final String password;
  

  RecordUsuario({required this.id, required this.nome, required this.email, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = password;
    return data;
  }
}