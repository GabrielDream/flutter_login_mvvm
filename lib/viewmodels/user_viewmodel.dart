import 'package:flutter/foundation.dart'; 

import '../models/api_user.dart'; 
import '../services/user_service.dart';

class UsersViewModel extends ChangeNotifier {
  
  final UserService _userService = UserService(); 

  List<ApiUser> _users = []; // Private attribute

  List<ApiUser> get users => _users; // Public getter

  Future<void> fetchUsers() async {
    _users = await _userService.getUsers(); 
    notifyListeners();
  }
}