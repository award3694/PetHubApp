import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RegProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String _message = '';

  bool get isLoading => _isLoading;
  String get message => _message;

  Future<bool> registerUser(Map<String, dynamic> userData) async {
    _isLoading = true;
    notifyListeners();

    try {
      _message = await _apiService.registerUser(userData);
      if (_message == "User registered successfully!") {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _message = 'Something went wrong: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
