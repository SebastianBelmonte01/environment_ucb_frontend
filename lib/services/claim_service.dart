import 'dart:convert';

import 'package:environment_ucb/data/provider/api.dart';
import 'package:environment_ucb/dto/claim_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class ClaimService {

  static Future<List<ClaimDto>> getPendingClaims() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response = await http.get(
      Uri.parse("${Api.url}/pending/claim"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'charset': 'utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
    );
    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes);
      var responseBody = jsonDecode(decodedResponse)['response'];
      print(responseBody);
      List<ClaimDto> claims = [];
      for (var claim in responseBody) {
        claims.add(ClaimDto.fromJson(claim));
      }
      return claims;
    } else {
      print(response.body);
      print("Failed to get pending claims");
      throw Exception('Failed to get pending claims');
    }
    

  }
  
}