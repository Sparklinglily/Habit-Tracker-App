import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/addHabit/model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class HabitProvider extends ChangeNotifier {
  final CollectionReference habitCollection =
      FirebaseFirestore.instance.collection('habits');
  List<HabitModel> _habits = [];

  List<HabitModel> get habits => _habits;

  //add habit
  Future<void> addHabit(
    String text, {
    required String habitName,
    required String description,
    required Bool completed,
    required String imageAssetPath,
    required int duration,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final newHabit = HabitModel(
      id: '',
      name: habitName,
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
        'name': habitName,
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
      print('error fetching habits from firestore:$e');
    }
  }
}
