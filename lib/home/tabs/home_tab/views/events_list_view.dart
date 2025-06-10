import 'package:eventlly/common/services/firebase_services.dart';
import 'package:eventlly/home/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:eventlly/home/tabs/home_tab/widgets/event_card.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:eventlly/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedCategory = context.watch<HomeTabProvider>().selectedCategory;
    return FutureBuilder(
      future: FirebaseServices.getAllEvents(categoryValue:selectedCategory!=CategoryValues.all?selectedCategory:null),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          var data = snapshot.data ?? [];
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: data.length,
              itemBuilder:
                  (context, index) => EventCard(
                    eventDataModel: data[index],
                  ),
            ),
          );
        }
      },
    );
  }
}
