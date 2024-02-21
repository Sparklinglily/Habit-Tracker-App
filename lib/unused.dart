// import 'dart:ffi';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:habit_help/presentation/views/addHabit/model.dart';

// final FirebaseFirestore firestore = FirebaseFirestore.instance;

// class HabitProvider extends ChangeNotifier {
//   final CollectionReference habitCollection =
//       FirebaseFirestore.instance.collection('habits');
//   List<HabitModel> _habits = [];

//   File? _pickedImage;
//   File? get pickedImage => _pickedImage;

//   List<HabitModel> get habits => _habits;

//   //add habit
//   Future<void> addHabit({
//     required String name,
//     required String description,
//     required String imageAssetPath,
//     required int duration,
//     required DateTime startDate,
//     required DateTime endDate,
//   }) async {
//     final newHabit = HabitModel(
//       id: '',
//       name: name,
//       completed: false,
//       description: description,
//       status: 'ongoing',
//       imageAssetPath: imageAssetPath,
//       duration: duration,
//       endDate: endDate,
//       startDate: startDate,
//     );
//     _habits.add(newHabit);
//     notifyListeners();
//     try {
//       //add habit to firestore with status ongoing
//       DocumentReference documentReference = await habitCollection.add({
//         'id': '',
//         'name': name,
//         'completed': false,
//         'description': description,
//         'status': 'ongoing',
//         'imageAssetPath ': imageAssetPath,
//         'duration': duration,
//         'startDate': Timestamp.fromDate(startDate),
//         'endDate': Timestamp.fromDate(endDate)
//       });

//       newHabit.id = documentReference.id;
//       notifyListeners();
//     } catch (e) {
//       print('Error adding habit to FireStoore: $e');
//     }
//   }
//   //function to add image

//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       _pickedImage = File(pickedFile.path);
//       notifyListeners();
//     }
//   }

//   //fetching habits from firestore
//   Future<void> fetchHabit() async {
//     try {
//       //fetch habits from firestore
//       QuerySnapshot querySnapshot = await habitCollection.get();

//       //update localist with fetched habits
//       _habits = querySnapshot.docs.map((doc) {
//         return HabitModel(
//           id: doc['id'],
//           name: doc['name'],
//           completed: doc['completed'],
//           description: doc['description'],
//           status: doc['ongoing'],
//           duration: doc['duration'],
//           endDate: doc['endDate'],
//           startDate: doc['startDate'],
//           imageAssetPath: doc['imageAssetPath'],
//         );
//       }).toList();
//       notifyListeners();
//     } catch (e) {
//       // print('error fetching habits from firestore:$e');
//     }
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:habit_help/presentation/views/addHabit/addHabitMethod.dart';
// import 'package:habit_help/presentation/views/addHabit/model.dart';
// import 'package:provider/provider.dart';
// import '../../../styles/constants.dart';

// class HabitsTab extends StatefulWidget {
//   final List<HabitModel> habit;
//   const HabitsTab({Key? key, required this.habit}) : super(key: key);

//   @override
//   State<HabitsTab> createState() => _HabitsTabState();
// }

// class _HabitsTabState extends State<HabitsTab> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(11.0),
//         child: ListView(
//             children: widget.habit
//                 .map((habits) => HabitListItem(habit: habits))
//                 .toList()));
//   }
// }

// class HabitListItem extends StatelessWidget {
//   final HabitModel habit;

//   HabitListItem({required this.habit});

//   @override
//   Widget build(BuildContext context) {
//     final habitProvider = Provider.of<HabitProvider>(context);
//     return Column(
//       children: [
//         ListTile(
//           title: Text(habit.name),
//           subtitle: Text(habit.description),
//           trailing: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               if (habit.completed)
//                 const Icon(
//                   Icons.check,
//                   color: Colors.amber,
//                 ),
//               if (habitProvider.pickedImage != null)
//                 Image.file(
//                   habitProvider.pickedImage!,
//                   width: 50,
//                   height: 50,
//                 ),
//               Text(
//                 'Completed on ${habit.completedTimeStamp}',
//                 style: const TextStyle(fontSize: 13),
//               )
//             ],
//           ),
//           onTap: () {
//             //check if the habit is not completed before navigating
//             if (!habit.completed) {
//               habit.markAsCompleted();
//               Navigator.pushNamed(context, '/completedHabits');
//             }
//           },
//         ),
//       ],
//     );
//   }
// }

// class HabitsPage extends StatefulWidget {
//   const HabitsPage({Key? key}) : super(key: key);

//   get completedHabits => completedHabits;

//   @override
//   State<HabitsPage> createState() => _HabitsPageState();
// }

// class _HabitsPageState extends State<HabitsPage> {
//   @override
//   Widget build(BuildContext context) {
//     final habitProvider = Provider.of<HabitProvider>(context);
//     final onGoingHabits = habitProvider.habits
//         .where((habits) => habits.status == 'ongoing')
//         .toList();

//     final completedHabits = habitProvider.habits
//         .where((habits) => habits.status == 'completed')
//         .toList();

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//           length: 2,
//           child: Scaffold(
//             appBar: AppBar(
//               //instead of using an appBar that can be so wide
//               // use a flexible space to reduce the space that the app bar occupies
//               backgroundColor: const Color(0xFFFAFAFA),
//               flexibleSpace: const Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TabBar(
//                     tabs: [
//                       Text(
//                         "Ongoing",
//                         style: TextStyle(
//                             color: fontDark,
//                             height: 1.5,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 21),
//                       ),
//                       Text(
//                         "Completed",
//                         style: TextStyle(
//                             color: fontDark,
//                             height: 1.5,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 24),
//                       )
//                     ],
//                     indicatorColor: primaryLight,
//                     indicatorSize: TabBarIndicatorSize.label,
//                   )
//                 ],
//               ),
//               elevation: 0,
//             ),
//             body: TabBarView(
//               children: [
//                 HabitsTab(habit: onGoingHabits),
//                 HabitsTab(habit: completedHabits),
//               ],
//             ),
//           )),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:habit_help/presentation/views/addHabit/addHabitMethod.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../styles/constants.dart';

// class AddHabitPage extends StatefulWidget {
//   const AddHabitPage({Key? key}) : super(key: key);

//   @override
//   State<AddHabitPage> createState() => _AddHabitPageState();
// }

// class _AddHabitPageState extends State<AddHabitPage> {
//   final TextEditingController habitNameController = TextEditingController();
//   final TextEditingController habitDescriptionController =
//       TextEditingController();
//   final TextEditingController habitDurationController = TextEditingController();

//   //initState for habitProvider.fetchHabits()

//   @override
//   Widget build(BuildContext context) {
//     final habitProvider = Provider.of<HabitProvider>(context);

//     final size = MediaQuery.sizeOf(context);
//     return Scaffold(
//         appBar: AppBar(
//           // backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: true,
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 40.0, left: 15, right: 15),
//             child: Column(children: [
//               const Text(
//                 'Add a habit',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               TextField(
//                 controller: habitNameController,
//                 decoration: const InputDecoration(
//                     hintText: 'Name', border: OutlineInputBorder()),
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               TextField(
//                 controller: habitDescriptionController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'description'),
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               TextField(
//                 controller: habitDurationController,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'duration of habit'),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               ElevatedButton.icon(
//                   onPressed: () async {
//                     await habitProvider.pickImage();
//                   },
//                   icon: const Icon(Icons.arrow_downward_outlined),
//                   label: const Text('Pick Image')),
//               ElevatedButton(
//                   onPressed: () {
//                     //making all required or not required in the addHabit Function.
//                     habitProvider.addHabit(
//                       startDate: DateTime.now(),
//                       endDate: DateTime.now().add(const Duration(days: 30)),
//                       name: habitNameController.text,
//                       imageAssetPath: 'assets/images/water2.jpg',
//                       description: habitDescriptionController.text,
//                       duration: int.parse(habitDurationController.text),
//                     );
//                     habitNameController.clear();
//                     habitDescriptionController.clear();
//                     habitDurationController.clear();
//                     Navigator.pushNamed(context, '/habits');
//                   },
//                   child: const Text('Save')),
//             ]),
//           ),
//         ));
//   }
// }

