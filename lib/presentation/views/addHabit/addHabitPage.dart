import 'dart:io';

import 'package:flutter/material.dart';
import 'package:habit_help/presentation/styles/constants.dart';
import 'package:habit_help/presentation/views/chat/components/addHabitTextFields.dart';
import 'package:image_picker/image_picker.dart';

class AddHabitPage extends StatefulWidget {
  AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  File? _pickedImage;
  File? get pickedImage => _pickedImage;
  final items = ['Daily', 'three times a week', 'five times a week, '];
  final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  String selectedValue = 'Daily';
  String selectedDay = 'Monday';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: size.width * 0.6,
                  width: size.height * 0.47,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 248, 238, 247),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70),
                        bottomLeft: Radius.circular(70.0)),
                  ),
                  child: _pickedImage == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.image_search,
                              size: 32,
                              color: primaryLight,
                            ),
                            TextButton(
                                child: const Text(
                                  'Upload Photo',
                                  style: TextStyle(color: secondaryDark),
                                ),
                                onPressed: () async {
                                  pickImage();
                                }),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          ),
                          child: Image.file(
                            _pickedImage!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ))),
              const SizedBox(
                height: 25,
              ),
              const MyTextFields(
                hintText: 'Title',
              ),
              const SizedBox(
                height: 15,
              ),
              const MyTextFields(
                hintText: 'Set Duration',
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 238, 247),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        width: 1,
                        color: primaryDark,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      const Text('Frequency'),
                      DropdownButton<String>(
                          isExpanded: true,
                          value: selectedValue,
                          items: items
                              .map<DropdownMenuItem<String>>((String value) =>
                                  DropdownMenuItem<String>(
                                      value: value, child: Text(value)))
                              .toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Column(
                          children: [
                            TextField(
                                onTap: () {
                                  selectStartDate();
                                },
                                controller: startDateController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                    hintText: 'Select Start Date',
                                    hintStyle: TextStyle(fontSize: 12),
                                    prefixIcon: Icon(
                                        Icons.calendar_today_outlined,
                                        color: primaryDark,
                                        size: 16),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 248, 238, 247),
                                    border: InputBorder.none)

                                //readonly true

                                ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        child: Column(
                          children: [
                            TextField(
                                onTap: () {
                                  selectEndDate();
                                },
                                controller: endDateController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                        Icons.calendar_today_outlined,
                                        color: primaryDark,
                                        size: 16),
                                    hintText: 'Select End Date',
                                    hintStyle: TextStyle(fontSize: 12),
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 248, 238, 247),
                                    border: InputBorder.none)

                                //readonly true

                                ),
                          ],
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 248, 238, 247),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        width: 1,
                        color: primaryDark,
                      )),
                  child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedDay,
                      items: days
                          .map<DropdownMenuItem<String>>((String value) =>
                              DropdownMenuItem<String>(
                                  value: value, child: Text(value)))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDay = newValue!;
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      //notifyListeners();
    }
  }

  Future<void> selectStartDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025));
    if (_picked != null) {
      setState(() {
        startDateController.text = _picked.toString().split('/')[0];
      });
    }
  }

  Future<void> selectEndDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025));
    if (_picked != null) {
      setState(() {
        endDateController.text = _picked.toString().split('/')[0];
      });
    }
  }
}
