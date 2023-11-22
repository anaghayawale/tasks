import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key, required this.labelName, required this.textController});

  final String labelName;
  final TextEditingController textController;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: widget.textController ,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF393939),
          fontSize: 13,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          labelText: widget.labelName,
          labelStyle: const TextStyle(
            color: Color(0xFF755DC1),
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xFF837E93),
              )),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFF9F7BFF),
            ),
          ),
        ),
      ),
    );
  }
}
