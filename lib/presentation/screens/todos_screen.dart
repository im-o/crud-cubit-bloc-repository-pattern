import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/data/models/todo.dart';
import 'package:todo_app/util/util_function.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();

    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (!(state is TodosLoaded)) return CircularProgressIndicator();
          final todos = (state).todos;
          return SingleChildScrollView(
            child: Column(
             children: todos!.map((e) => _todo(e, context)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _todo(Todo? todo, context) {
    loge("_todo : $todo");
    return Dismissible(
      key: Key("${todo?.id}"),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey))
        ),
        child: Row(
          children: [
            Text("${todo?.todoMessage}")
          ],
        ),
      ),
    );
  }
}
