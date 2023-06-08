import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/custom_colors.dart';

dynamic customSnackBar(context , {final msg , final Color color = customRed}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: color,
    duration: const Duration(seconds: 30),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  ));
}
