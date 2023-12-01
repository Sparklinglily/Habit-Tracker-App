import 'package:flutter/material.dart';

class InvitePage extends StatelessWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}










// class ClassScreen extends StatefulWidget {
//   const ClassScreen({super.key});
//
//   @override
//   State<ClassScreen> createState() => _ClassScreen();
// }
//
// class _ClassScreen extends State<ClassScreen> {
//   List<ClassButton> lstButtons = [];
//
//   String txtNumber = "";
//
//   @override
//   void initState() {
//     for (int i = 0; i < 5; i++) {
//       lstButtons.add(ClassButton(id: i));
//     }
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//         body: Container(
//             width: width,
//             height: height,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.05,
//                 ),
//                 Column(
//                   children: lstButtons,
//                 ),
//                 SizedBox(
//                   height: height * 0.05,
//                 ),
//                 Container(
//                   width: width * 0.9,
//                   height: height * 0.2,
//                   child: Text(txtNumber),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       txtNumber = "The following ids were pressed:\n";
//                       for (ClassButton classButton in lstButtons) {
//                         if (classButton.isClicked == true) {
//                           txtNumber += classButton.id.toString() + " ";
//                         }
//                       }
//                     });
//                   },
//                   child: Text("Which button ids are clicked?"),
//                 )
//               ],
//             )));
//   }
// }
//
//
//
//
// class ClassButton extends StatefulWidget {
//   bool _isClicked = false;
//   final int id;
//
//   bool get isClicked => _isClicked;
//
//   ClassButton({required this.id});
//
//   @override
//   _ClassButton createState() => _ClassButton();
// }
//
// class _ClassButton extends State<ClassButton> {
//
//   void _buttonClicked() {
//     setState(() {
//       widget._isClicked = !widget._isClicked;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Container(
//           width: width * 0.8,
//           height: height * 0.05,
//           margin: EdgeInsets.only(bottom:height * 0.02),
//           child: OutlinedButton(
//             child: Text(widget._isClicked == true ? "Clicked" : "Not Clicked"),
//             style: OutlinedButton.styleFrom(
//               foregroundColor: Color(0xFF2FB8F6),
//               side: BorderSide(
//                 color: Color(0xFF2FB8F6),
//               ),
//             ),
//             onPressed: _buttonClicked,
//           )),
//     );
//
//   }
// }
//
