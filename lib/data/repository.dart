import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<Todo>?> fetchTodos() async {
    final todosRaw = await networkService.fetchTodos();
    return todosRaw?.map((e) => Todo.fromJson(e)).toList();
  }

  Future<bool> changeCompletion(bool isCompleted, int id) async {
    final patchObj = {"isCompleted" : isCompleted.toString()}; //why toString ? because map and we have to send String
    return await networkService.patchTodo(patchObj, id);
  }
}
