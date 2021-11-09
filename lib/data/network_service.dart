import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "http://localhost:3000";
  Future<List<dynamic>?> fetchTodos() async {
    try {
      final response = await get(Uri.parse(baseUrl + "/todos"));
      print(response.body);
      jsonDecode(response.body) as List;
    } catch (e) {
      print("Error baseUrl : $e");
      return [];
    }
  }
}
