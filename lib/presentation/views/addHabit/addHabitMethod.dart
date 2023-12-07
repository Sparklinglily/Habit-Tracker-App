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
    _habits.add(HabitModel(
      name: habitName,
      completed: false,
      description: description,
    ));
    notifyListeners();
    try {
      await habitCollection.add({
        'name': habitName,
        'completed': false,
        description: description,
      });
    } catch (e) {
      print('Error adding habit to FireStoore: $e');
    }
  }
}
