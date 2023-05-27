import 'dart:convert';

import 'package:environment_ucb/dto/environment_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../data/provider/api.dart';

class EnvironmentService {
  static Future<List<EnvironmentDto>> getEnvironments() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response = await http.get(
      Uri.parse("${Api.url}/environment"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'

      },
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)["response"]);
      List<EnvironmentDto> environments = List<EnvironmentDto>.from(jsonDecode(response.body)["response"].map((environment) => EnvironmentDto.fromJson(environment)));
      print(environments);
      return List<EnvironmentDto>.from(jsonDecode(response.body)["response"].map((environment) => EnvironmentDto.fromJson(environment)));
    }
    else {
      throw Exception('Failed to load environments');
    }
  }

}