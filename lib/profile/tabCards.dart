import 'package:flutter/material.dart';

import '../constants/constants.dart';

// class TabCards extends StatelessWidget {
//   final int image ;
//   final String tit ;
//   final String subtit ;
//   final int endingIcon ;
//
//   const TabCards({Key? key, required this.image, required this.tit, required this.subtit, required this.endingIcon}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       width: MediaQuery.of(context).size.height * .42,
//       decoration: BoxDecoration(
//           color: background,
//           borderRadius: BorderRadius.circular(6),
//           boxShadow: [
//             BoxShadow(
//                 color:fontLight,
//                 offset: Offset(1,2)
//             )
//           ]
//       ),
//       child: ListTile(
//         leading:
//         CircleAvatar(
//           backgroundImage: AssetImage("$image"),
//           radius: 23,
//
//         ),
//         title:
//         Text("$tit"),
//
//         trailing: Text(endingIcon),
//         subtitle: Text("$subtit"),
//       ),
//     );
//
//   }
// }
//
