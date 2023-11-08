// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:to_do_list_crud_operation/screens/to_do.dart';
import 'package:to_do_list_crud_operation/screens/done_task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: '/', // Initial route set to the home screen
      routes: {
        '/': (context) => TodoListPage(),
        '/done_tasks': (context) => DoneTasksPage(),
      },
    );
  }
}
