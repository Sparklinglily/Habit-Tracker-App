import 'package:flutter/material.dart';
import '../constants/constants.dart';


class SaveButton extends StatefulWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    TextButton(onPressed: () {},
        child: const Text("Save",
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              color: primaryDark,

            )
        )
    )
    );
  }
}
