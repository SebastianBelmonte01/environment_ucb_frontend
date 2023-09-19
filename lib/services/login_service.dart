import 'dart:convert';
import 'package:environment_ucb/data/provider/api.dart';
import 'package:environment_ucb/dto/api_response.dart';
import 'package:environment_ucb/dto/auth_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<ApiResponse> login(String username, String password) async {
    print('${Api.url}/auth/login');
    try {
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
        print(ApiResponse.fromJson(responseBody).response.authToken);
        return ApiResponse.fromJson(responseBody);
      } else {
        print("Failed to login");
        throw Exception('Failed to login');
      }
    } catch (e) {
      print(e);
    }
    return ApiResponse(
        code: 'a',
        response: AuthResponse(authToken: 's', refreshToken: ''),
        errorMessage: 's');
  }

  static Future<void> createAccount(String email, String password) async {
    print(email);
    try{
      final response = await http.post(
        Uri.parse('${Api.url}/user'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if(response.statusCode == 200){
        print("OK");
      }
      else{
        print("Failed to create account");
        throw Exception('Failed to create account');
      }
    }
    catch(e){
      print(e);
    }
  }
}
