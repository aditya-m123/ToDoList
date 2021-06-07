import 'package:flutter/material.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final String textTitle;
  final bool isChecked;
  final ValueChanged<bool?> checkboxCallback;
  Function onLongPressed;

  TaskTile(
      {required this.textTitle,
      required this.isChecked,
      required this.checkboxCallback,
      required this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$textTitle',
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: () => onLongPressed,
    );
  }
}
