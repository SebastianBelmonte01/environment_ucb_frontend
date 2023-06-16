import 'package:environment_ucb/dto/api_response.dart';
import 'package:environment_ucb/dto/request_dto.dart';
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

  static Future<List<ReservationDto>> getMyRejectedReservation() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.get(
      Uri.parse('${Api.url}/request/rejected'),
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
      print("Failed to get rejected requests");
      throw Exception('Failed to get rejected requests');
    }
  }

  static Future<List<RequestDto>> getAdminPendingRequest() async{
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.get(
      Uri.parse('${Api.url}/reservation/pending'),
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
        requests.add(RequestDto.fromJson(request));
      }
      return requests;
    } else {
      print("Failed to get ADMIN PENDENT requests");
      throw Exception('Failed to get ADMIN PENDENT requests');
    }   
  }

  static Future<List<ReservationDto>> getMyCompletedRequests() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.get(
      Uri.parse('${Api.url}/reservation/complete'),
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
        requests.add(ReservationDto.fromJson(request));
      }
      print("Completed requests");
      return requests;
    } else {
      print("Failed to get rejected requests");
      throw Exception('Failed to get rejected requests');
    }
  }
  
  static Future<ApiResponse> deleteReservation(int reservationId) async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.put(
      Uri.parse('${Api.url}/reservation/delete/$reservationId'),
      headers: <String, String> {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      }
    );
    if (response.statusCode == 200) {
      final decodedResponse = utf8.decode(response.bodyBytes); 
      print(jsonDecode(decodedResponse)["response"]);
      print("Reservation deleted");
      return ApiResponse.fromJson(jsonDecode(decodedResponse));
    } else {
      print("Failed to delete reservation");
      throw Exception('Failed to delete reservation');
    }
  }

  static Future<void> acceptRejectedRequest(int reservationId) async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    final response = await http.put(
      Uri.parse('${Api.url}/request/reject/accept/$reservationId'),
      headers: <String, String> {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
    );
    if (response.statusCode == 200) {
      print("Request id $reservationId accepted rejection");
    } else {
      print("Failed to accept request id $reservationId");
      throw Exception('Failed to accept request');
    }
  }
}