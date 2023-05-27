
import 'dart:convert';
import 'package:environment_ucb/dto/professor_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../data/provider/api.dart';


class ProfessorService {

  static Future<ProfessorDto> getProfessor() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response = await http.get(
      Uri.parse("${Api.url}/professor/subject"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'charset': 'utf-8',
        'Accept': 'application/json',
        'Accept-Language': 'es',
        'Authorization': 'Bearer $authToken'
      },
    );

    if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes); // Decode response using UTF-8
        print(jsonDecode(decodedResponse)["response"]);
        return ProfessorDto.fromJson(jsonDecode(decodedResponse)["response"]);

    }
    else {
      throw Exception('Failed to load professor');
    }


  }


}
