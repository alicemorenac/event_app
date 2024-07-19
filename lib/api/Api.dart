import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

// API_KEY = AIzaSyBibL_SJ0O5BkTJlXFxj700h-YjFYhWjLw
class ApiClient {
  final String _baseUrl = 'http://localhost:8000';
  get baseURI => _baseUrl;

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


  Future<http.Response> POST_MULTPART (String endpoint, dynamic body, File? file) async {
    final request = http.MultipartRequest('POST', Uri.parse('$_baseUrl$endpoint'));

    body.forEach((key, value) {
      request.fields[key] = value;
    });


    if (file != null) {
      request.files.add(
        http.MultipartFile(
          'foto', 
          file.readAsBytes().asStream(),
          await file.length(),
          filename: path.basename(file.path),
        ),
      );
    }

    // Envia a requisição
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    return http.Response(responseBody, response.statusCode);
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
