import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_hub/utils/constants.dart';

class ApiService {
  // register User

  Future<String> registerUser(Map<String, dynamic> userData) async {
    // print(userData);
    try {
      final response = await http.post(
        Uri.parse(regUrl), // URL for signup endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );
      print(response.toString());

      if (response.statusCode == 201) {
        return "User registered successfully!";
      } else if (response.statusCode == 500) {
        return "Failed to register user. Please try again later.";
      } else {
        return "An unexpected error occurred.";
      }
    } catch (e) {
      return 'Error: Failed to register user: $e';
    }
  }

  // Login User
  Future<String> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl), // URL for login endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return "Login successful! Welcome, ${data['user']['fullName']}.";
      } else if (response.statusCode == 401) {
        return "Invalid email or password.";
      } else if (response.statusCode == 404) {
        return "User not found.";
      } else {
        return "An unexpected error occurred.";
      }
    } catch (e) {
      return 'Error: Failed to login: $e';
    }
  }
}
