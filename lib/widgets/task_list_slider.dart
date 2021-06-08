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

          return Dismissible(
            key: Key(Provider.of<Task_Data>(context).tasks[index].name),
            background: Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "DELETE",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              deleteData(index, context);
            },
            child: TaskTile(
              textTitle: task_number.name,
              isChecked: task_number.isChecked,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task_number);
              },
              longPressCallBack: () {},
            ),
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }

  deleteData(int index, BuildContext context) {
    // set up the buttons
    Widget deleteText = TextButton(
      onPressed: () {
        Provider.of<Task_Data>(context, listen: false).deleteTask(index);
        Navigator.pop(context);
      },
      child: Text('Yes'),
    );
    Widget canceldialog = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('No'),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like to dele this todo ?"),
      actions: [
        deleteText,
        canceldialog,
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
