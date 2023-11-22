import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF755DC1),
        fontSize: 27,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
