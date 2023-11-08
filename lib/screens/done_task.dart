// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:to_do_list_crud_operation/global/global.dart';

class DoneTasksPage extends StatefulWidget {
  @override
  _DoneTasksPageState createState() => _DoneTasksPageState();
}

class _DoneTasksPageState extends State<DoneTasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Tasks'),
      ),
      body: globalDoneTaskList.isEmpty
          ? Center(
              child: Text('List of done tasks will appear here.'),
            )
          : ListView.builder(
              itemCount: globalDoneTaskList.length,
              itemBuilder: (context, index) {
                final task = globalDoneTaskList[index];
                return ListTile(
                  title: Text(task.title),
                  leading: Icon(Icons.check, color: Colors.green),
                );
              },
            ),
    );
  }
}
