import 'dart:ffi';

class HabitModel {
  final String name;
  final bool completed;
  final String description;
  HabitModel(
      {required this.name, required this.completed, required this.description});
}
