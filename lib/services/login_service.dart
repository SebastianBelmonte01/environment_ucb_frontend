import 'dart:convert';
import 'package:environment_ucb/data/provider/api.dart';
import 'package:environment_ucb/dto/login_response_dto.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<LoginResponseDto> login(
      String username, String password) async {
    String baseURL = Api.url;
    final response = await http.post(
      Uri.parse('${baseURL}auth/login'),
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
      return LoginResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
