import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed ;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
