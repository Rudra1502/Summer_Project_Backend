import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      'http://192.168.64.41:5001/api/auth'; // Replace with your actual backend URL

  Future<String?> registerUser({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    print('First Name: $firstName');
print('Last Name: $lastName');
print('Username: $userName');
print('Email: $email');
print('Phone Number: $phoneNumber');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'userName': userName,
          'email': email,
          'phoneNumber': phoneNumber,
          'password': password,
        }),
      );
      print(response);
      if (response.statusCode == 201) {
        return 'User registered successfully';
      } else {
        // Handle error responses
        final Map<String, dynamic> responseData = json.decode(response.body);
        return responseData['msg'] ?? 'Registration failed';
      }
    } catch (e) {
      print('Registration failed: $e');
      return 'Registration failed';
    }
  }
}
