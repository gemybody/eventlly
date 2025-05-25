import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/custom_text_Styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightThem = ThemeData(
    dividerTheme: DividerThemeData(color: AppColors.mainColor),
    hoverColor: AppColors.greyColor,
    highlightColor: AppColors.mainColor,
    dividerColor: AppColors.lightTextColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),

    scaffoldBackgroundColor: AppColors.secLightColor,
    textTheme: TextTheme(
      bodySmall: CustomTextStyles.style14w400dark,
      bodyMedium: CustomTextStyles.style16w400dark,
      bodyLarge: CustomTextStyles.style18w400dark,

      labelSmall: CustomTextStyles.style14w500dark,
      labelMedium: CustomTextStyles.style16w500dark,
      labelLarge: CustomTextStyles.style18w500dark,

      titleSmall: CustomTextStyles.style14w700dark,
      titleMedium: CustomTextStyles.style16w700dark,
      titleLarge: CustomTextStyles.style18w700dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Rag',
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      iconTheme: IconThemeData(color: AppColors.mainColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.mainColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
    ),
  );
  static ThemeData darkThem = ThemeData(
    hoverColor: AppColors.mainColor,
    dividerColor: AppColors.ofWhiteTextColor,
    highlightColor: AppColors.secDarkColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
    textTheme: TextTheme(
      bodySmall: CustomTextStyles.style14w400light,
      bodyMedium: CustomTextStyles.style16w400light,
      bodyLarge: CustomTextStyles.style18w400light,

      labelSmall: CustomTextStyles.style14w500light,
      labelMedium: CustomTextStyles.style16w500light,
      labelLarge: CustomTextStyles.style18w500light,

      titleSmall: CustomTextStyles.style14w700light,
      titleMedium: CustomTextStyles.style16w700light,
      titleLarge: CustomTextStyles.style18w700light,
    ),
    scaffoldBackgroundColor: AppColors.secDarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Rag',
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      iconTheme: IconThemeData(color: AppColors.mainColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.secDarkColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
    ),
  );
}
