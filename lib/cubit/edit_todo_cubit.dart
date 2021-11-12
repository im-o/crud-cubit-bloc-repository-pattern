import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/data/repository.dart';

part 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  final Repository repository;
  final TodosCubit todosCubit;

  EditTodoCubit({required this.repository, required this.todosCubit})
      : super(EditTodoInitial());

  void deleteTodo(Todo todo) {
    repository.deleteTodo(todo.id).then((isDeleted) {
      if (isDeleted ?? true) {
        todosCubit.deleteTodo(todo);
        emit(TodoEdited());
      }
    });
  }

  void updateTodo(Todo todo, String message) {
    if (message.isEmpty) {
      emit(EditTodoError(error: "Message is empty"));
      return;
    }
    emit(EditingTodo());
    Timer(Duration(seconds: 2), () {
      repository.updateTodo(todo, message).then((isEdited) {
        if (isEdited ?? true) {
          todo.todoMessage = message;
          todosCubit.updateTodoList();
          emit(TodoEdited());
        }
      });
    });
  }
}
