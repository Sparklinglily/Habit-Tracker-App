import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/todoList/toDoUtil/alertDialog.dart';
import 'package:habit_help/presentation/views/todoList/toDoUtil/toDoTile.dart';
import 'package:hive/hive.dart';
import '../../../../core/constants/constants.dart';
import '../../todoList/todoListPage.dart';
import 'addTask.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  //reference the hive box
  final _lilybox = Hive.box("lilybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //if thiss is the first time opening this app then create default data
    if (_lilybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //if there already exists data or any changes
      db.loadData();
    }

    super.initState();
  }

  final TextEditingController _controller = TextEditingController();

  // List toDoList = [
  //   ["Go to the market", false],
  //   ["code for 5 hours", true],
  //   ["clean the house", true]
  //
  // ];

  //checkbox when tapped
  void checkBoXClicked(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabse();
  }

  //when the save button is clicked
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabse();
  }

  //when th floating action button is clicked
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // isExtended: true,

        backgroundColor: primaryDark,

        onPressed: createNewTask,
        foregroundColor: primaryLight,
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: secondaryDark,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoXClicked(value, index),
            //THE delete function should carry the index.
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
