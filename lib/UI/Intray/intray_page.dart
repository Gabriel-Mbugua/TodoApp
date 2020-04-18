import 'package:flutter/material.dart';
import 'package:todoapp/UI/widgets/todo_widget.dart';
import 'package:todoapp/models/global.dart';
import 'package:todoapp/models/task.dart';

class IntrayPage extends StatefulWidget {
  IntrayPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    taskList = getList();
    return Container(
      color: darkGreyColor,
      child: Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: ReorderableListView(
          padding: const EdgeInsets.only(top: 200),
          children: taskList.map((Task item) => _buildListTile(context, item)).toList(),
          onReorder: (oldIndex, newIndex) {
            setState(() {
              Task item = taskList[oldIndex];
              taskList.remove(item);
              taskList.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
//    return TodoWidget(keyValue: item.keyValue, title: item.title, subtitle: item.subtitle,);
    return ListTile(
      key: Key(item.taskId),
      title: TodoWidget(
        title: item.title,
        subtitle: item.completed.toString(),
      ),
    );
  }

  List<Task> getList() {
    for (int i = 0; i < 10; i++) {
      if(taskList.length > 9){
        break;
      }
      taskList.add(Task(
          title: "My Todo ${i.toString()}",
          completed: false,
          taskId: i.toString()));
    }
    return taskList;
  }
}
