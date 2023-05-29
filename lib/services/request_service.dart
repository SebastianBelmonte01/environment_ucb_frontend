import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data/provider/api.dart';
import '../dto/request_dto.dart';
import 'package:http/http.dart' as http;


class RequestService {
  static Future<RequestDto> postRequest(RequestDto request) async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.post(
      Uri.parse('${Api.url}/request'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
      body: jsonEncode(request.toJson()),
    );
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body)['response'];
      return RequestDto.fromJson(responseBody);
    } else {
      print("Failed to post request");
      throw Exception('Failed to post request');
    }
  }

  static Future<RequestDto> getLastRequest() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.get(
      Uri.parse('${Api.url}/request/last'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      }

    );
    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes); // Decode response using UTF-8
      print(jsonDecode(decodedResponse)["response"]);
      return RequestDto.fromJson(jsonDecode(decodedResponse)["response"]);
    } else {
      print("Failed to get last request");
      throw Exception('Failed to get last request');
    }
  }

  static Future<List<RequestDto>> getMyPendingRequests() async{
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.get(
      Uri.parse('${Api.url}/request/pending'),
      headers: <String, String> {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      }
    );

    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes); 
      print(jsonDecode(decodedResponse)["response"]);
      List<RequestDto> requests = [];
      for (var request in jsonDecode(decodedResponse)["response"]) {
        print(request);
        requests.add(RequestDto.fromJson(request));
      }
      return requests;
    } else {
      print("Failed to get pending requests");
      throw Exception('Failed to get pending requests');
    }
  }

  static Future<void> cancelRequest(int id) async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.put(
      Uri.parse('${Api.url}/request/$id'),
      headers: <String, String> {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      }
    );
    if (response.statusCode == 200) {
      print("Request id $id cancelled");
    } else {
      print("Failed to cancel request id $id");
      throw Exception('Failed to cancel request');
    }
  }

  

}