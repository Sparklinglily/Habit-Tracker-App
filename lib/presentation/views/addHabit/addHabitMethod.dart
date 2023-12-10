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
  Future<void> addHabit(String habitName, String description) async {
    final newHabit = HabitModel(
      name: habitName,
      completed: false,
      description: description,
      status: 'ongoing',
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
            name: doc['name'],
            completed: doc['completed'],
            description: doc['description'],
            status: doc['ongoing']);
      }).toList();
      notifyListeners();
    } catch (e) {
      print('error fetching habits from firestore:$e');
    }
  }
}
