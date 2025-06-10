import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/services/firebase_services.dart';
import 'package:eventlly/common/view/catogeries_slider.dart';
import 'package:eventlly/common/widgets/custom_main_button.dart';
import 'package:eventlly/common/widgets/custom_text_styles.dart';
import 'package:eventlly/events/widgets/custom_text_faild.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:eventlly/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventPage extends StatefulWidget {
  static const String routeName = '/createEventPage';
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  CategoryValues selectedCategory = CategoryValues.all;
  TextEditingController titleController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String states = '', error = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Event',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF5668FF),
            fontSize: 22,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.27,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  selectedCategory.getDesgin(),
                  height: size.height * .25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 16),
              CatogeriesSlider(
                categoryValues: selectedCategory,
                onSelect: (p0) {
                  selectedCategory = p0;
                  setState(() {});
                },
              ),
              SizedBox(height: 16),
              CustomTextFaild(
                title: 'Title',
                controller: titleController,
                hintText: 'Event Title',
                prefixIcon: Icon(
                  Icons.mode_edit_rounded,
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(height: 16),
              CustomTextFaild(
                title: 'Description',
                controller: descreptionController,
                hintText: 'Event Description',
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).textTheme.labelMedium!.color,
                  ),
                  Text(
                    'Event Date',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      _selectDate();
                    },
                    child: Text(
                      selectedDate == null
                          ? 'Choose Date'
                          : DateFormat('yyyy/MM/dd').format(selectedDate!),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).textTheme.labelMedium!.color,
                  ),
                  Text(
                    'Event Time',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      _selectTime();
                    },
                    child: Text(
                      selectedTime == null
                          ? 'Choose Time'
                          : '${selectedTime!.hour}:${selectedTime!.minute}:${selectedTime!.period.name}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),

              states == 'loading'
                  ? Center(child: CircularProgressIndicator())
                  : states == 'error'
                  ? Text(error)
                  : CustomMainButton(
                    tittle: 'Add Event',
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          selectedDate != null &&
                          selectedTime != null) {
                        setState(() {
                          states = 'loading';
                        });

                        try {
                          selectedDate!.copyWith(
                            hour: selectedTime!.hour,
                            minute: selectedTime!.minute,
                          );
                          EventDataModel eventDataModel = EventDataModel(
                            title: titleController.text.trim(),
                            descripetion: descreptionController.text.trim(),
                            categoryValues: selectedCategory,
                            dateTime: selectedDate!,
                          );
                          FirebaseServices.addNewEvent(eventDataModel);
                          setState(() {
                            states = 'sucess';

                            selectedDate = null;
                            selectedTime = null;
                            titleController.clear();
                            descreptionController.clear();
                            selectedCategory = CategoryValues.all;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Event Was Added Successfuly ",
                                style: CustomTextStyles.style18w500light,
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } catch (e) {
                          setState(() {
                            error = e.toString();
                            states = 'error';
                          });
                        }
                      } else if (selectedDate == null || selectedTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "The Date Or Time Is Missing",
                              style: CustomTextStyles.style18w500light,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }

  _selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null) {
      selectedTime = pickedTime;
      setState(() {});
    }
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      // initialDate: DateTime.now(),
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2070),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
