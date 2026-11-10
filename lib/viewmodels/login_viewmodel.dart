import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _message = '';
  bool _isSuccess = false;

  String get message => _message;
  bool get isSuccess => _isSuccess;

  void updateEmail(String value) {
    _email = value;
    _clearMessage();
  }

  void updatePassword(String value) {
    _password = value;
    _clearMessage();
  }

  void login() {
    if (_email.trim().isEmpty || _password.isEmpty) {
      _isSuccess = false;
      _message = 'Please fill in all fields.';
    } else {
      _isSuccess = true;
      _message = 'Demo: Login successful!';
    }

    notifyListeners();
  }

  void _clearMessage() {
    if (_message.isEmpty) return;

    _message = '';
    _isSuccess = false;
    notifyListeners();
  }
}