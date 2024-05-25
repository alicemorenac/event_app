import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String _baseUrl = 'https://eventos-2g689.ondigitalocean.app';

  Future<http.Response> GET(String endpoint) async {
    return await http.get(Uri.parse('$_baseUrl$endpoint'));
  }

  Future<http.Response> POST (String endpoint, dynamic body) async {
    return await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

  }

  Future<http.Response> PUT(String endpoint, dynamic data) async {
    return await http.put(
      Uri.parse('$_baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

  }

  Future<http.Response> DELETE(String endpoint) async {
    return await http.delete(
      Uri.parse('$_baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
