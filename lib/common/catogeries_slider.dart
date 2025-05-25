import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/custom_text_styles.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:flutter/material.dart';

class CatogeriesSlider extends StatelessWidget {
  CatogeriesSlider({super.key, required this.categoryValue, required this.onSelect});
  final CategoryValue categoryValue;
  final void Function(CategoryValue) onSelect;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemCount: CategoryModel.categories.length,

        padding: EdgeInsets.all(4),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          CategoryModel currentCatModel = CategoryModel.categories[index];
          return GestureDetector(
            onTap: () {
              onSelect(currentCatModel.categoryValue);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    currentCatModel.categoryValue == categoryValue
                        ? Theme.of(context).dividerColor
                        : null,
                borderRadius: BorderRadius.circular(46),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    currentCatModel.iconData,
                    color:
                        currentCatModel.categoryValue == categoryValue
                            ? AppColors.mainColor
                            : Theme.of(context).dividerColor,
                  ),
                  Text(
                    currentCatModel.title,
                    style: CustomTextStyles.style14w700light.copyWith(
                      color:
                          currentCatModel.categoryValue == categoryValue
                              ? AppColors.mainColor
                              : Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder:
            (BuildContext context, int index) => SizedBox(width: 10),
      ),
    );
  }
}
// ChoiceChip(
//               selectedColor: Theme.of(context).dividerColor,
//               showCheckmark: false,
//               labelStyle: CustomTextStyles.style16w700light.copyWith(
//                 color: Theme.of(context).hoverColor,
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(46),
//               ),
//               side: BorderSide(color: Theme.of(context).dividerColor, width: 2),

//               backgroundColor: Colors.transparent,
//               color: WidgetStatePropertyAll(
//                 index == 0
//                     ? Theme.of(context).dividerColor
//                     : Theme.of(context).highlightColor,
//               ),
//               label: Row(
//                 children: [
//                   Icon(
//                     Icons.cake_outlined,
//                     color:
//                         index == 0
//                             ? Theme.of(context).highlightColor
//                             : Theme.of(context).dividerColor,
//                   ),
//                   Text(
//                     'xxxxxx',
//                     style: CustomTextStyles.style16w700light.copyWith(
//                        color:
//                         index == 0
//                             ? Theme.of(context).highlightColor
//                             : Theme.of(context).dividerColor,
//                     ),
//                   ),
//                 ],
//               ),
//               selected: index == 0,
//             ),
