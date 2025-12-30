import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  // 🔑 API key dari Google AI Studio
  static const String _apiKey = 'AIzaSyC1Mim5ZqzMijSbKLQUPS53T1JwOx0P8uI';

  // ✅ ENDPOINT FINAL YANG BENAR
  static final Uri _url = Uri.parse(
    'https://generativelanguage.googleapis.com/v1/models/'
    'gemini-1.5-flash-latest:generateContent?key=$_apiKey',
  );

  static Future<String> ringkas(String materi) async {
    try {
      final response = await http.post(
        _url,
        headers: const {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text":
                      "Ringkas materi berikut secara singkat dan jelas:\n$materi"
                }
              ]
            }
          ]
        }),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        return response.body;
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
