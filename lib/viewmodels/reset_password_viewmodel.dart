import 'package:flutter/foundation.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  String _email = '';
  String _newPassword = '';
  String _confirmPassword = '';
  String _message = '';
  bool _isSuccess = false;

  String get message => _message;
  bool get isSuccess => _isSuccess;

  void updateEmail(String value) {
    _email = value;
    _clearMessage();
  }

  void updateNewPassword(String value) {
    _newPassword = value;
    _clearMessage();
  }

  void updateConfirmPassword(String value) {
    _confirmPassword = value;
    _clearMessage();
  }

  void resetPassword() {
    if (_email.trim().isEmpty ||
        _newPassword.isEmpty ||
        _confirmPassword.isEmpty) {
      _isSuccess = false;
      _message = 'Please fill in all fields.';
    } else if (_newPassword != _confirmPassword) {
      _isSuccess = false;
      _message = 'Passwords do not match.';
    } else {
      _isSuccess = true;
      _message = 'Demo: Password reset successful!';
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