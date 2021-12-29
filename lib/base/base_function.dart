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

final dateTimeFormat = DateFormat("dd MMMM yyyy hh:mm:ss");
