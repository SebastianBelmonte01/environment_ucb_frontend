import 'dart:convert';
import 'package:environment_ucb/data/provider/api.dart';
import 'package:environment_ucb/dto/api_response.dart';
import 'package:environment_ucb/dto/auth_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<ApiResponse> login(
      String username, String password) async {
    final response = await http.post(
      Uri.parse('${Api.url}/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': username,
        'secret': password,
      }),
    );
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      const storage = FlutterSecureStorage();
      storage.write(
          key: 'authToken', value: responseBody['response']['authToken']);
      print(responseBody);
      return ApiResponse.fromJson(responseBody);
    } else {
      print("Failed to login");
      throw Exception('Failed to login');
    }
  }
}
