import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'addTask.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15,35,15,35),
          child: Column(
            children: [
             Container(
               alignment: Alignment.topRight,
               child:  ElevatedButton.icon(
                 style: ElevatedButton.styleFrom(
                     padding: EdgeInsets.all(7)),
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTask(),
                   ));

                 },label: const Text("Create  New Task"),
                 icon: Icon(Icons.add),

               ),
             ),

                  //image
              const Image(image: AssetImage("images/oopss.png"),
                height: 400,
                width: 500,

              ),

              //oops
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSpacing ),
                child: Text("Oops!! You have not added "
                    "any new tasks for today. Add a new "
                    "task to begin.",
                    style: TextStyle(
                      height: 1.5,
                        fontWeight: FontWeight.w500,
                        fontSize: defaultSpacing * 1.5
                    )
                ),
              ),





            ],
          ),
        ),

    );
  }
}
