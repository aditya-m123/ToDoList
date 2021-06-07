import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/task_screen.dart';
import 'package:todoapp/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Task_Data(),
        child: MaterialApp(
          home: TaskScreen(),
        ));
  }
}
