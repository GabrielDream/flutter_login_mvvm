import 'dart:convert'; 
import 'package:http/http.dart' as http; 
import '../models/api_user.dart';

class UserService {
  Future<List<ApiUser>> getUsers() async {

       final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/users',
    );

    // 2. Send an HTTP request and await its response
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch users');
    }

    final data = jsonDecode(response.body) as List<dynamic>;
    
    final users = data.map((item) {
      return ApiUser.fromJson(item as Map<String, dynamic>);
    }).toList(); 

    return users; 
  }
}