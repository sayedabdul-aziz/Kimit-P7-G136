import 'package:chat_app_ui/colors.dart';
import 'package:flutter/material.dart';

TextStyle getTitleStyle({Color color = Colors.black, double fontSize = 20}) {
  return TextStyle(
      color: color, fontWeight: FontWeight.w500, fontSize: fontSize);
}

TextStyle getBodyStyle() {
  return TextStyle(
      color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 16);
}

TextStyle getSmallStyle() {
  return TextStyle(
      color: AppColors.black, fontWeight: FontWeight.w400, fontSize: 14);
}
