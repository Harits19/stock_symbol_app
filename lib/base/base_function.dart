import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

push(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

pushReplace(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

String dateTimeToString(DateTime dateTime) {
  return DateFormat("dd MMMM yyyy hh:mm:ss").format(dateTime);
}
