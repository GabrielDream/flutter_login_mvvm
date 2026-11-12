import 'dart:convert';
import 'dart:js_interop';
import 'package:flutter_login_mvvm/models/recordUsuario.dart';
import 'package:http/http.dart' as http; 

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_login_mvvm/models/recordUsuario.dart';

class DemoApiService {
  Future<RecordUsuario> getAutentiqueUser() async {
    // 1. Define the API endpoint
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/todos/1',
    );

    // 2. Send an HTTP request and await its response
    final response = await http.get(url);

    // 3. Check the HTTP status
    if (response.statusCode != 200) {
      throw Exception('API request failed');
    }

    // 4. Decode JSON text into a Dart Map
    final data =
        jsonDecode(response.body) as Map<String, dynamic>;

    // 5. Convert the Map into a typed object
    final usuario = RecordUsuario.fromJson(data);

    // 6. Return the object
    return usuario;
  }
}