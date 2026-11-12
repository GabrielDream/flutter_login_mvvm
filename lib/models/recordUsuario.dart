class RecordUsuario {
  final String id;
  final String nome;
  final String email;
  final String password;
  

  RecordUsuario({required this.id, required this.nome, required this.email, required this.password});

  Map<String, dynamic> toJson() { //Method return type
    final Map<String, dynamic> data = <String, dynamic>{}; //Every key must be a String. Example: 'email'. dynamic - value : ex: values can be different types; 
    //This is the local variable
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = password; 
    return data;
  }

  factory RecordUsuario.fromJson(Map<String, dynamic> json) {
    
    return RecordUsuario(id: 'id', nome: 'nome', email: 'email', password: 'senha');
    
    }

}