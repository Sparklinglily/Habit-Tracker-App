import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/addHabit/addHabitMethod.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/constants.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({Key? key}) : super(key: key);

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final TextEditingController habitNameController = TextEditingController();
  final TextEditingController habitDescriptionController =
      TextEditingController();
  final TextEditingController habitDurationController = TextEditingController();

  //initState for habitProvider.fetchHabits()

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);

    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 15, right: 15),
            child: Column(children: [
              const Text(
                'Add you first Habit ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 45,
              ),
              TextField(
                controller: habitNameController,
                decoration: const InputDecoration(
                    hintText: 'Name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 21,
              ),
              TextField(
                controller: habitDescriptionController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'description'),
              ),
              const SizedBox(
                height: 21,
              ),
              TextField(
                controller: habitDurationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'duration of habit'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    //making all required or not required in the addHabit Function.
                    habitProvider.addHabit(
                      habitName: habitNameController.text,
                      description: habitDescriptionController.text,
                      imageAssetPath: '',
                      duration: 30,
                      startDate: DateTime.now(),
                      endDate: DateTime.now().add(Duration(days: 30)),
                      completed: ,
                    );
                    habitNameController.clear();
                    habitDescriptionController.clear();
                    Navigator.pushNamed(context, '/habits');
                  },
                  child: const Text('Save')),
            ]),
          ),
        ));
  }
}
