import 'package:flutter/material.dart';
import 'package:habit_help/core/constants/constants.dart';
import 'package:habit_help/presentation/views/todoList/toDoUtil/myButtons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {Key? key,
      required this.controller,
      required this.onSave,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryLight,
      content: Container(
        color: primaryLight,
        height: 119,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  hintText: "Add new Task"),
            ),
            //save and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButtons(text: "Save", onPressed: onSave),
                SizedBox(
                  width: 5,
                ),

                //cancel button
                MyButtons(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
