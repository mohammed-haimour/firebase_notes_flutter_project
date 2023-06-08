import 'package:flutter/material.dart';

Future<dynamic> goTo(context, dynamic to) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => to));
}

void replaceTo(context, dynamic to) {
  Navigator.of(context).popUntil((route) => route.isFirst);

  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => to));
}

void backTo(context) {
  return Navigator.pop(context);
}
