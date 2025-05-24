import 'package:eventlly/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMainOutlinedButton extends StatelessWidget {
  CustomMainOutlinedButton({
    super.key,
    this.onPressed,
    required this.tittle,
    this.icon,
  });
  final void Function()? onPressed;
  final String tittle;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.mainColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon == null ? SizedBox() : icon!,
           // if (icon != null) icon! else SizedBox(),
            Text(
              tittle,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
