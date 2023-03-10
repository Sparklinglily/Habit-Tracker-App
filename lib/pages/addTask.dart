import 'package:flutter/material.dart';
import 'package:habit_help/pages/tasks.dart';
import '../constants/constants.dart';
import 'package:habit_help/widgets/saveButton.dart';
import 'package:habit_help/widgets/setPrior.dart';
import 'package:habit_help/widgets/setTime.dart';




class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(4,8,6,8),
        child: ListView(
          children: [
            //appbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Tasks(),
                  ));

                } , icon: const Icon(
                    Icons.arrow_back,size: 29,)),
        const SaveButton(),
              ],
            ),
            //rest of the body
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.0),
              child: Text("Task name",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: secondaryLight
              ),),
            ),
            //row for set priority and time
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SetPriority(),
                SetTime()
              ],
            ),
            const SizedBox(height: 18,),
            //description

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Add description",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  // labelText: "Add description",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: accent,
                      width: 2.0
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                ),
                maxLines: 3,

              ),
            ),
            SizedBox(height: 19,),



            //sub descrition
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Sub description",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  // labelText: "Add description",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: accent,
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),


                  ),


                ),
                maxLines: 11,

              ),
            ),








          ],
        ),
      ),








      // Column(
      //   children: [
      //     //SAVE AND BACK ICON
      //     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //
      //
      //
      //
      //       ],
      //
      //     )
      //   ],
      // ),

    );
  }
}
