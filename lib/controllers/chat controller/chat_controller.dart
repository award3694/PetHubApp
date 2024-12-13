import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final String _apiKey =
      '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';
  final String _apiUrl = 'https://api.groq.com/openai/v1/chat/completions';

  var isLoading = false.obs;
  var messages = <String>[].obs;

  Future<void> sendMessage(String prompt) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "llama3-70b-8192", // Use a supported model ID
          "messages": [
            {"role": "user", "content": prompt}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['choices'][0]['message']['content'];
        messages.add("You: $prompt");
        messages.add("AI: $reply");
      } else {
        messages.add("Error: ${response.body}");
      }
    } catch (e) {
      messages.add("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
