import 'package:eventlly/common/view/catogeries_slider.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:flutter/material.dart';

class CreateEventPage extends StatefulWidget {
  static const String routeName = '/createEventPage';
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  CategoryValues selectedCategory = CategoryValues.all;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
              categoryValue: selectedCategory,
              onSelect: (p0) {
                selectedCategory = p0;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
