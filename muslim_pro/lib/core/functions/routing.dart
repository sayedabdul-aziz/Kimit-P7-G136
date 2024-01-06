import 'package:flutter/material.dart';

pushTo(context, Widget newScreen) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newScreen,
  ));
}

pushToWithReplacment(context, Widget newScreen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newScreen,
  ));
}
