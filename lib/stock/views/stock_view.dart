import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StockView extends StatelessWidget {
  const StockView({
    Key? key,
    this.text,
    this.onTap,
    this.isWatched = false,
  }) : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final bool isWatched;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text ?? ""),
      trailing: isWatched ? const Icon(FontAwesomeIcons.binoculars) : null,
      onTap: onTap,
    );
  }
}
