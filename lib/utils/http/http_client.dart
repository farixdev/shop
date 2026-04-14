import 'dart:convert';
import 'package:http/http.dart' as http;



class FHttpHelper
{

  static const String _baseUrl = "your api key here"; //replace with your api key

  //helper methor to make a get request to the api
  static Future<Map<String, dynamic>> get(String endpoint) async
  {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
   
  }


  //helper method to make a post request to the api
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async
  {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }


  //helper method to make a put request to the api
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async
  {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }


  //helper method to make a delete request to the api
  static Future<Map<String, dynamic>> delete(String endpoint) async
  {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }


  //handle the HTTP response and return the data or throw an error
  static Map<String, dynamic> _handleResponse(http.Response response)
  {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }




}