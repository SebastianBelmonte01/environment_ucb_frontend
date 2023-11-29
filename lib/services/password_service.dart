import 'package:environment_ucb/data/provider/api.dart';
import 'package:http/http.dart' as http;

class PasswordService {
  static Future<String> password(String mail) async {
    try {
      final response = await http.post(
        Uri.parse('${Api.url}/mail/send?email=$mail'),
        // Include any necessary headers or body data here if required
        // headers: { 'Authorization': 'Bearer YOUR_TOKEN' },
        // body: { 'key': 'value' },
      );
      
      if (response.statusCode == 200) {
        print("Email sent successfully");
        return "OK";
      } else {
        print("Failed to send email - Status code: ${response.statusCode}");
        throw Exception('Failed to send email');
      }
    } catch (e) {
      print("Exception occurred: $e");
      throw Exception('Failed to send email: $e');
    }
  }

  static Future<String> changePassword(String mail, String code, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${Api.url}/mail/verify?email=$mail&code=$code&password=$password'),
        // Include any necessary headers or body data here if required
        // headers: { 'Authorization': 'Bearer YOUR_TOKEN' },
        // body: { 'key': 'value' },
      );
      
      if (response.statusCode == 200) {
        print("Password changed successfully");
        return "OK";
      } else {
        print("Failed to change password - Status code: ${response.statusCode}");
        throw Exception('Failed to change password');
      }
    } catch (e) {
      print("Exception occurred: $e");
      throw Exception('Failed to change password: $e');
    }
  }
}
