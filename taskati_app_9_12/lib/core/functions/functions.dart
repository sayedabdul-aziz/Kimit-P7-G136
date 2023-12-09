import 'package:flutter/material.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';

showErrorWidget(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.redColor,
      content: Text(text)));
}

pushWithReplacment(context, Widget newView) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newView,
  ));
}

push(context, Widget newView) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newView,
  ));
}
