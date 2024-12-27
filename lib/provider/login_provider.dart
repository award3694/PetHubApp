import 'package:flutter/material.dart';
import '../services/api_service.dart';

class LoginProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String _message = '';

  bool get isLoading => _isLoading;
  String get message => _message;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _message = await _apiService.loginUser(email, password);

      if (_message.contains("Login successful")) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _message = 'An error occurred: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
