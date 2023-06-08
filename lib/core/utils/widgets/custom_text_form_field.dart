import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.inputType,
      required this.innerText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscure = false,
      this.controller,
      this.validator,
      this.onSaved,
      this.maxLenght,
      this.maxLines = 1,
      this.initialValue})
      : super(key: key);

  final TextInputType? inputType;
  final String innerText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscure;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final void Function(String?)? onSaved;
  final int? maxLenght;
  final int maxLines;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLength: maxLenght,
      maxLines: maxLines,
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      obscureText: obscure ?? false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          suffixIcon: Icon(suffixIcon),
          prefixIcon: Icon(prefixIcon),
          label: Text(innerText)),
    );
  }
}
