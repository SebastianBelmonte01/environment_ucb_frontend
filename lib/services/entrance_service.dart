
import 'package:environment_ucb/data/provider/api.dart';
import 'package:environment_ucb/dto/entrance_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class EntranceService {

  static Future<String> registerEntrance(EntranceDto entranceDto) async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response = await http.put(
      Uri.parse("${Api.url}/reservation/entrance"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
      body: jsonEncode(entranceDto.toJson()),
    );
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body)['response'];
      if (responseBody == null) {
        return "Ambiente no corresponde al asignado";
      }
      return "Ambiente detectado";
    } else {
      print(response.body);
      print("Failed to register entrance");
      throw Exception('Failed to register entrance');
    }
  }



  



}