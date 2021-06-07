import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Task_Data>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task_number = taskData.tasks[index];

          return TaskTile(
              textTitle: task_number.name,
              isChecked: task_number.isChecked,
              onLongPressed: () {
                print('delete');
                taskData.deleteTask(index);
              },
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task_number);
              });
        },
        itemCount: taskData.taskCount,
      );
    });
  }

  deleteData(String textTitle, BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
