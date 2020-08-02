import 'package:flutter/material.dart';

class RoundTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final bool obscureText;
  final TextAlign textAlign;
  final bool autofocus;
  final FormFieldValidator<String> validator;
  final Alignment alignment;
  final EdgeInsetsGeometry margin;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final TextStyle hintStyle;
  final EdgeInsetsGeometry contentPadding;

  const RoundTextFormField({
    Key key,
    this.hint,
    this.controller,
    this.inputType = TextInputType.text,
    this.obscureText,
    this.textAlign = TextAlign.center,
    this.validator,
    this.alignment,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.autofocus = false,
    this.hintStyle,
    this.contentPadding,
    this.margin = const EdgeInsets.only(
      top: 10.0,
      left: 40.0,
      right: 40.0,
      bottom: 10.0,
    ),
  }) : super(key: key);

  const RoundTextFormField.textLeft({
    Key key,
    this.hint,
    this.controller,
    this.inputType = TextInputType.text,
    this.obscureText,
    this.textAlign = TextAlign.left,
    this.validator,
    this.alignment,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.autofocus = false,
    this.hintStyle,
    this.contentPadding = const EdgeInsets.only(left: 20.0),
    this.margin = const EdgeInsets.only(
      top: 10.0,
      left: 40.0,
      right: 40.0,
      bottom: 10.0,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: alignment ?? Alignment.center,
      child: TextFormField(
        onSaved: onSaved,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        textAlign: textAlign,
        controller: controller,
        keyboardType: inputType,
        validator: validator,
        autofocus: autofocus,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: hintStyle,
          // contentPadding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          contentPadding: prefixIcon == null
              ? contentPadding ?? const EdgeInsets.all(0.0)
              : const EdgeInsets.only(
                  right: 50.0,
                ),
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
