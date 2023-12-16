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
            padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
            child: Column(children: [
              const Text(
                'Add a Habit ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: habitNameController,
                decoration: InputDecoration(
                    hintText: 'Name', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: habitDescriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'description'),
              ),
              SizedBox(
                height: 21,
              ),
              TextField(
                controller: habitDurationController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'duration'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    //making all required or not required in the addHabit Function.
                    habitProvider.addHabit(
                      habitName: '',
                      description: ' ',
                      imageAssetPath: '',
                      duration: null,
                      startDate: null,
                      endDate: null,
                      completed: null,
                    );
                    habitNameController.clear();
                    habitDescriptionController.clear();
                    Navigator.pushNamed(context, '/habits');
                  },
                  child: Text('Save')),
            ]),
          ),
        ));
  }
}
