
class ApiUser {
  final int id; 
  final String name; 
  final String email; 

  ApiUser({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }

  factory ApiUser.fromJson(Map<String, dynamic> json) {
      return ApiUser(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
    );
  }
}