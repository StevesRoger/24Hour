import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final double height;
  final double width;

  const RoundTextField({
    Key key,
    this.hint,
    this.controller,
    this.inputType,
    this.height = 45.0,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          contentPadding: const EdgeInsets.all(5.0),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(40.0),
            ),
          ),
        ),
      ),
    );
  }
}
