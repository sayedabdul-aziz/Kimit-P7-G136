import 'package:flutter/material.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';
import 'package:taskati_app_9_12/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.width = 100});
  final String text;
  final Function()? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style: getBodyStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
