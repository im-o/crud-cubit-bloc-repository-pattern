import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;

  const EditTodoScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            autocorrect: true,
            decoration: InputDecoration(hintText: "Enter todo message..."),
          ),
          SizedBox(
            height: 10.0,
          ),
          _updateBtn(context)
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
        child: Text(
          "Update Todo",
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
  }
}
