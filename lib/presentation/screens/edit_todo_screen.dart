import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/cubit/edit_todo_cubit.dart';
import 'package:todo_app/data/models/todo.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;
  final _controller = TextEditingController();

  EditTodoScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.text = todo.todoMessage;

    return BlocListener<EditTodoCubit, EditTodoState>(
      listener: (context, state) {
        if (state is TodoEdited) {
          Navigator.pop(context);
        } else if (state is EditTodoError) {
          Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            fontSize: 16.0,
            webPosition: "center",
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Todo"),
          actions: [
            InkWell(
              onTap: () {
                BlocProvider.of<EditTodoCubit>(context).deleteTodo(todo);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.delete),
              ),
            )
          ],
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            autocorrect: true,
            decoration: InputDecoration(hintText: "Enter todo message..."),
          ),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
              onTap: () {
                BlocProvider.of<EditTodoCubit>(context)
                    .updateTodo(todo, _controller.text);
              },
              child: _updateBtn(context))
        ],
      ),
    );
  }

  Widget _updateBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: BlocBuilder<EditTodoCubit, EditTodoState>(
          builder: (context, state) {
            if (state is EditingTodo)
              return Center(
                  child: CircularProgressIndicator(color: Colors.white));
            return Text(
              "Update Todo",
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
