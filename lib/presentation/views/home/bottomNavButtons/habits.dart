import 'package:flutter/material.dart';
import 'package:habit_help/presentation/views/addHabit/addHabitMethod.dart';
import 'package:habit_help/presentation/views/addHabit/model.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';

class HabitsTab extends StatefulWidget {
  final List<HabitModel> habit;
  
  

  const HabitsTab({Key? key,required this.habit}) : super(key: key);

  @override
  State<HabitsTab> createState() => _HabitsTabState();
}

class _HabitsTabState extends State<HabitsTab> {
   
   

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        children: habit.map((habits) => HabitListItem(habit: habits)).toList();
      
      )
    );
  }
}
class HabitListItem extends StatelessWidget {
  final HabitModel habit;

  HabitListItem({required this.habit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(habit.name),
      subtitle: Text(habit.description),
      trailing: habit.completed ? Icon(Icons.check) : null,
    );
  }
}

class HabitsPage extends StatefulWidget {
  const HabitsPage({Key? key}) : super(key: key);

  @override
  State<HabitsTab> createState() => _HabitsTabState();
}

class _HabitsPageState extends State<HabitsTab> {
  @override
  Widget build(BuildContext context) {
     final habitProvider = Provider.of<HabitProvider>(context);
    final onGoingHabits = habitProvider.habits
        .where((habits) => habits.status == 'ongoing')
        .toList();

    final completedHabits = habitProvider.habits
        .where((habits) => habits.status == 'completed')
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              //instead of using an appBar that can be so wide
              // use a flexible space to reduce the space that the app bar occupies
              backgroundColor: const Color(0xFFFAFAFA),
              flexibleSpace: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabBar(
                    tabs: [
                      Text(
                        "Ongoing",
                        style: TextStyle(
                            color: fontDark,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                      ),
                      Text(
                        "Completed",
                        style: TextStyle(
                            color: fontDark,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                      )
                    ],
                    indicatorColor: primaryLight,
                    indicatorSize: TabBarIndicatorSize.label,
                  )
                ],
              ),
              elevation: 0,
            ),
            body:  TabBarView(
              children: [
                HabitsTab(habit:onGoingHabits ),
                HabitsTab(habit: completedHabits),
                ],
            ),
          )),
    );
  }
}
