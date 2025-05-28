import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/widgets/custom_text_styles.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:eventlly/provideres/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatogeriesSlider extends StatelessWidget {
  CatogeriesSlider({
    super.key,
    required this.categoryValue,
    required this.onSelect,
    this.invertColors = false,
  });
  final CategoryValues categoryValue;
  final bool invertColors;
  final void Function(CategoryValues) onSelect;

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context);
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
                        ? (Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? AppColors.mainColor
                            : Theme.of(context).dividerColor)
                        : null,

                border: Border.all(
                  color:
                      invertColors
                          ? (context.watch<ThemeProvider>().themeMode ==
                                  ThemeMode.light
                              ? AppColors.mainColor
                              : AppColors.lightTextColor)
                          : (context.watch<ThemeProvider>().themeMode ==
                                  ThemeMode.dark
                              ? AppColors.lightTextColor
                              : AppColors.mainColor),
                ),

                borderRadius: BorderRadius.circular(46),
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(
                    currentCatModel.iconData,
                    color:
                        currentCatModel.categoryValue == categoryValue
                            ? Theme.of(context).colorScheme.brightness ==
                                    Brightness.dark
                                ? AppColors.lightTextColor
                                : invertColors
                                ? AppColors.lightTextColor
                                : AppColors.mainColor
                            : invertColors
                            ? AppColors.mainColor
                            : Theme.of(context).dividerColor,
                  ),
                  Text(
                    currentCatModel.title,
                    style: CustomTextStyles.style14w700light.copyWith(
                      color:
                          currentCatModel.categoryValue == categoryValue
                              ? Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? AppColors.lightTextColor
                                  : invertColors
                                  ? AppColors.lightTextColor
                                  : AppColors.mainColor
                              : invertColors
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
