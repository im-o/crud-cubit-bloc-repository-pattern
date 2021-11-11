import 'package:flutter/material.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
      ),
      body: Center(
        child: Text("Edit Todo"),
      ),
    );
  }
}
