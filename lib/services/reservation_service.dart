import 'package:environment_ucb/dto/reservation_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/provider/api.dart';

class ReservationService {
  static Future<List<ReservationDto>> getMyAccepetedRequest() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.get(
      Uri.parse('${Api.url}/request/accepted'),
      headers: <String, String> {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      }
    );

    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes); 
      print(jsonDecode(decodedResponse)["response"]);
      List<ReservationDto> requests = [];
      for (var request in jsonDecode(decodedResponse)["response"]) {
        print("Reservatiooon;");
        print(request);
        requests.add(ReservationDto.fromJson(request));
      }
      return requests;
    } else {
      print("Failed to get accepted requests");
      throw Exception('Failed to get accepted requests');
    }
  }
}