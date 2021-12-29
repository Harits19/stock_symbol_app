import 'package:flutter/material.dart';

class CircularView extends StatelessWidget {
  const CircularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
