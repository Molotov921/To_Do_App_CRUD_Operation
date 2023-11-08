// ignore_for_file: unused_element, use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:to_do_list_crud_operation/global/global.dart';

class Task {
  String title;
  bool isDone;
  Task({required this.title, this.isDone = false});
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<Task> _todoList = [];
  final TextEditingController _textFieldController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoList.add(Task(title: task)); // Adding a Task object to the list
      });
      _textFieldController.clear();
    }
  }

  void _deleteTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  void _editTodoItem(String task, int index) {
    setState(() {
      _todoList[index].title = task; // Updating the title of the Task object
    });
  }

  void _toggleDone(int index) {
    setState(() {
      Task task = _todoList.removeAt(index);
      task.isDone = !task.isDone;
      globalDoneTaskList.add(task);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (context, index) {
        final task = _todoList[index];
        return ListTile(
          title: Text(
              task.title), // Accessing the title property of the Task object
          leading: Checkbox(
            value:
                task.isDone, // Accessing the isDone property of the Task object
            onChanged: (bool? value) {
              if (value != null) {
                _toggleDone(index);
              }
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteTodoItem(index),
          ),
          onTap: () => _showEditDialog(task.title, index),
        );
      },
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New to-do'),
          content: TextField(
            controller: _textFieldController,
            autofocus: true, // Ensure the text field gets focus
            decoration: InputDecoration(hintText: 'Enter to-do item'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _textFieldController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addTodoItem(_textFieldController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(String currentTask, int index) {
    _textFieldController.text = currentTask;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit to-do'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Enter new to-do item'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                _textFieldController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'), // Changed 'Add' to 'Save'
              onPressed: () {
                _editTodoItem(_textFieldController.text, index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.done_all),
              onPressed: () {
                Navigator.of(context).pushNamed('/done_tasks');
              },
            ),
          ),
        ],
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}
