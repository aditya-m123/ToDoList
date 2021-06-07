import 'package:flutter/material.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  late String text_addtag = "";
  Task_Data tasklist = new Task_Data();
  @override
  Widget build(BuildContext context) {
    onPressedHandler(String text_addtag) {
      tasklist.addTask('adit');
    }

    ;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.add_shopping_cart,
              size: 10000,
            ),
            Text('Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30)),
            TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
                onChanged: (value) {
                  text_addtag = value;
                }),
            TextButton(
              child: Text('Add', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent)),
              onPressed: () {
                Provider.of<Task_Data>(context, listen: false)
                    .addTask(text_addtag);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
