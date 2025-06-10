import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/view/catogeries_slider.dart';
import 'package:eventlly/common/widgets/custom_text_styles.dart';
import 'package:eventlly/home/tabs/home_tab/provider/home_tab_provider.dart';
import 'package:eventlly/models/category_model.dart';
import 'package:eventlly/provideres/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    CategoryValues? selectedId =
        context.watch<HomeTabProvider>().selectedCategory;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back ✨',
                      style: CustomTextStyles.style14w400light.copyWith(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    Text(
                      'John Safwat',
                      style: CustomTextStyles.style18w700light.copyWith(
                        fontSize: 24,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).dividerColor,
                        ),
                        Text(
                          'Cairo , Egypt',
                          style: CustomTextStyles.style14w500light.copyWith(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ],
                    ), //TODE:Edit
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.read<ThemeProvider>().changeAppTheme();
                    },
                    icon: Icon(
                      Icons.wb_sunny_outlined,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Theme.of(context).dividerColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'EN',
                      style: CustomTextStyles.style14w700light.copyWith(
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CatogeriesSlider(
                categoryValues: selectedId,
                onSelect: (p0) {
                  context.read<HomeTabProvider>().editSelectedCategory(p0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
