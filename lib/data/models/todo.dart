class Todo {
  final String todoMessage;
  final bool isCompleted;
  final int id;

  Todo.fromJson(Map json)
      : todoMessage = json["todo"],
        isCompleted = json["isCompleted"] == true,
        id = json["id"] as int;
}
