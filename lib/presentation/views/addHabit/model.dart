import 'dart:ffi';

class HabitModel {
  final String id;
  final String name;
  bool completed;
  final String description;
  final String status;
  final String imageAssetPath; // Path to the habit's image asset
  final int duration;
  DateTime? completedTimeStamp;
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
      this.completedTimeStamp,
      //required this.id,

      this.completed = false,
      required this.description,
      required this.status});

  void markAsCompleted() {
    completed = true;
    completedTimeStamp = DateTime.now();
  }

  set id(String id) {}
}
