import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://192.168.65.121:5001/api/auth'; // Replace with your actual backend URL

  Future<String?> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Parse the token from the response
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData['token'];
      } else {
        // Handle other status codes
        return null;
      }
    } catch (e) {
      print('Login failed: $e');
      return null;
    }
  }
}
