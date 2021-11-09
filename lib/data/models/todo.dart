class Todo {
  late String todoMessage;
  late bool isCompleted;
  late int id;

  Todo.fromJson(Map json)
      : todoMessage = json["todo"],
        isCompleted = json["isCompleted"],
        id = json["id"] as int;
}
