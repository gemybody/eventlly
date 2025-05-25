import 'package:eventlly/common/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CatogeriesSlider extends StatelessWidget {
  const CatogeriesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        itemCount: 10,

        padding: EdgeInsets.all(4),
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(46),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.abc, color: Theme.of(context).dividerColor),
                  Text(
                    'adf',
                    style: CustomTextStyles.style16w700light.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
            ),
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
