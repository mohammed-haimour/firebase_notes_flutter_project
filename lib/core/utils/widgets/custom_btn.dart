import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/custom_colors.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      this.onPressed,
      required this.innnerText,
      this.width,
      this.height});

  final void Function()? onPressed;
  final String innnerText;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        color: customDarkBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: onPressed,
        child: Text(
          innnerText,
          style: const TextStyle(color: customGrey),
        ),
      ),
    );
  }
}
