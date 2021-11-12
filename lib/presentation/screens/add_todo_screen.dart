import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/cubit/add_todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Todo")),
      body: BlocConsumer<AddTodoCubit, AddTodoState>(
        builder: (context, state) {
          if (state is TodoAdded) Navigator.pop(context);
          return Container(
            margin: EdgeInsets.all(20.0),
            child: _body(context),
          );
        },
        listener: (context, state) {
          if (state is AddTodoError) {
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
      ),
    );
  }

  Widget _body(context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(hintText: "Enter todo message..."),
        ),
        SizedBox(
          height: 10.0,
        ),
        InkWell(
            onTap: () {
              final message = _controller.text;
              BlocProvider.of<AddTodoCubit>(context).addTodo(message);
            },
            child: _addBtn(context))
      ],
    );
  }

  Widget _addBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: BlocBuilder<AddTodoCubit, AddTodoState>(
          builder: (context, state) {
            if (state is AddingTodo)
              return Center(
                  child: CircularProgressIndicator(color: Colors.white));
            return Text(
              "Add Todo",
              style: TextStyle(color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}
