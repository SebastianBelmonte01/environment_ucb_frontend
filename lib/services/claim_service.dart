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
      Uri.parse("${Api.url}/pending/claim/admin"),
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

  static Future<String> registerNewClaim(int reservationId, String newClaim, List<int> imageData) async {
    final storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final request = http.MultipartRequest(
      'POST',
      Uri.parse("${Api.url}/claim/reservation/${reservationId}"),
    );

      request.headers['Authorization'] = 'Bearer $authToken';
      request.fields['newClaim'] = newClaim;
      request.files.add(
        http.MultipartFile.fromBytes(
          'imageFile',
          imageData,
          filename: 'image.jpg',
        ),
      );

      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final responseData = json.decode(responseString);
        return "Claim created successfully";
      } else {
        throw Exception('Failed to create new claim');
      }
  }

  static Future<List<ClaimDto>> getPendingClaimsUser() async {
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

  static Future<List<ClaimDto>> getAnsweredClaimsUser() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.get(
      Uri.parse("${Api.url}/attended/claim"),
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
      print("Failed to get attended claims");
      throw Exception('Failed to get pending claims');
    }
  }
  

  
}