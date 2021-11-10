import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/util/util_function.dart';

class NetworkService {
  Future<List<dynamic>?> fetchTodos() async {
    try {
      final baseUrl = "http://localhost:3000";
      final response = await http.get(Uri.parse(baseUrl + "/todos"));
      loge(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      loge(e.toString());
      return [];
    }
  }
}
