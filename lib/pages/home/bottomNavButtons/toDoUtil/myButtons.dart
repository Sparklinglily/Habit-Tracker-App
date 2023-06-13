import 'package:flutter/material.dart';


class MyButtons extends StatelessWidget {
  final String text;
  //VOid callbacks dont return a value to the parent WIDGET
  //IT ONLY NOTIFIES THE pARENT WIDGET of changes that occured in the child widget.
  VoidCallback onPressed;
   MyButtons({Key? key,
  required this.text,
  required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
        onPressed: onPressed,
    child: Text(text));
  }
}
