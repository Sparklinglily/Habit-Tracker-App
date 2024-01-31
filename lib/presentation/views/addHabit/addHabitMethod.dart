import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/addHabit/model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class HabitProvider extends ChangeNotifier {
  final CollectionReference habitCollection =
      FirebaseFirestore.instance.collection('habits');
  List<HabitModel> _habits = [];

  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  List<HabitModel> get habits => _habits;

  //add habit
  Future<void> addHabit({
    required String name,
    required String description,
    required String imageAssetPath,
    required int duration,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final newHabit = HabitModel(
      id: '',
      name: name,
      completed: false,
      description: description,
      status: 'ongoing',
      imageAssetPath: imageAssetPath,
      duration: duration,
      endDate: endDate,
      startDate: startDate,
    );
    _habits.add(newHabit);
    notifyListeners();
    try {
      //add habit to firestore with status ongoing
      DocumentReference documentReference = await habitCollection.add({
        'id': '',
        'name': name,
        'completed': false,
        'description': description,
        'status': 'ongoing',
        'imageAssetPath ': imageAssetPath,
        'duration': duration,
        'startDate': Timestamp.fromDate(startDate),
        'endDate': Timestamp.fromDate(endDate)
      });

      newHabit.id = documentReference.id;
      notifyListeners();
    } catch (e) {
      print('Error adding habit to FireStoore: $e');
    }
  }
  //function to add image

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _pickedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  //fetching habits from firestore
  Future<void> fetchHabit() async {
    try {
      //fetch habits from firestore
      QuerySnapshot querySnapshot = await habitCollection.get();

      //update localist with fetched habits
      _habits = querySnapshot.docs.map((doc) {
        return HabitModel(
          id: doc['id'],
          name: doc['name'],
          completed: doc['completed'],
          description: doc['description'],
          status: doc['ongoing'],
          duration: doc['duration'],
          endDate: doc['endDate'],
          startDate: doc['startDate'],
          imageAssetPath: doc['imageAssetPath'],
        );
      }).toList();
      notifyListeners();
    } catch (e) {
      // print('error fetching habits from firestore:$e');
    }
  }
}
