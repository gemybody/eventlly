import 'package:eventlly/common/app_assets.dart';
import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/widgets/custom_text_styles.dart';
import 'package:eventlly/models/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.eventDataModel});
  final EventDataModel eventDataModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              eventDataModel.categoryValues.getDesgin(),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                DateFormat('dd\nMMM').format(eventDataModel.dateTime),
                style: CustomTextStyles.style14w700light.copyWith(
                  color: AppColors.mainColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Text(
                      eventDataModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Icon(
                    eventDataModel.isFav
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: AppColors.mainColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
