import 'package:hive/hive.dart';

class ToDoDatabase{

  List toDoList = [];
  //reference the box
  final lilyBox = Hive.box("lilybox");

  //run this method if this is the first time ever running this app
void createInitialData(){
  toDoList= [
    ["Go to the market", false],
    ["code for 5 hours", true],
    ["clean the house", true]


  ];
}

//load data from database
void loadData(){
  //hive works inform of a key-value pair

  toDoList = lilyBox.get("TODOLIST");


}



//update database
void updateDatabse(){
  lilyBox.put("TODOLIST", toDoList);

}


}