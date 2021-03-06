import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/util/util_function.dart';

class NetworkService {
  final baseUrl = "http://localhost:3000";

  Future<List<dynamic>?> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + "/todos"));
      loge(response.body);
      return jsonDecode(response.body) as List;
    } catch (e) {
      loge(e.toString());
      return [];
    }
  }

  Future<bool> patchTodo(Map<String, String> patchObj, int id) async {
    try {
      loge("EXECUTE PATCH: $patchObj");
      await http.patch(Uri.parse(baseUrl + "/todos/$id"), body: patchObj);
      return true;
    } catch (e) {
      loge("EXECUTE ERROR: $e");
      return false;
    }
  }

  Future<Map?> addTodo(Map<String, String> todoObj) async {
    try {
      final response =
          await http.post(Uri.parse(baseUrl + "/todos"), body: todoObj);
      loge(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      loge(e.toString());
      return null;
    }
  }

  Future<bool?> deleteTodo(int id) async {
    try {
      await http.delete(Uri.parse(baseUrl + "/todos/$id"));
      return true;
    } catch (e) {
      loge(e.toString());
      return false;
    }
  }
}
