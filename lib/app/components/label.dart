import 'package:flutter/material.dart';

class MyLabel extends StatelessWidget {
  const MyLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Chip(label: Text(label)),
    );
  }
}
