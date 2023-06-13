import 'package:flutter/material.dart';
import 'package:habit_help/pages/home/bottomNavButtons/toDoUtil/alertDialog.dart';
import 'package:habit_help/pages/home/bottomNavButtons/toDoUtil/toDoTile.dart';
import 'package:hive/hive.dart';
import '../../../constants/constants.dart';
import 'addTask.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);


  @override
  State<Tasks> createState() => _TasksState();

}

class _TasksState extends State<Tasks> {

  //reference the hive box
  final _lilybox = Hive.openBox("lilybox");


  final TextEditingController _controller = TextEditingController();

  List toDoList = [
    ["Go to the market", false],
    ["code for 5 hours", true],
    ["clean the house", true]

  ];

  //checkbox when tapped
  void checkBoXClicked(bool? value, int index){
    setState(() {
      toDoList[index][1] = ! toDoList[index][1];
    });

  }
  //when the save button is clicked
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();

    });
    Navigator.of(context).pop();
  }
  //when th floating action button is clicked
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=>Navigator.of(context).pop()
      );
    });
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });

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
        child: const Icon(Icons.add,color: secondaryDark,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value)=> checkBoXClicked(value,index),
            deleteFunction: (context)=> deleteTask,

          );


        },

      ),
    );
  }
}


