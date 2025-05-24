import 'package:eventlly/common/app_colors.dart';
import 'package:eventlly/common/custom_text_Styles.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  CustomMainButton({super.key, this.onPressed, required this.tittle});
  final void Function()? onPressed;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          tittle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
