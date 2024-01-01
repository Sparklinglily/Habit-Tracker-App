import 'dart:ffi';

class HabitModel {
  final String id;
  final String name;
  final bool completed;
  final String description;
  final String status;
  final String imageAssetPath; // Path to the habit's image asset
  final int duration;
  // final List<String> days;
  // final TimeOfDay time;
  final DateTime startDate;
  final DateTime endDate;
  HabitModel(
      {required this.id,
      required this.name,
      required this.duration,
      required this.imageAssetPath,
      required this.startDate,
      required this.endDate,
      //required this.id,

      required this.completed,
      required this.description,
      required this.status});

  set id(String id) {}
}
