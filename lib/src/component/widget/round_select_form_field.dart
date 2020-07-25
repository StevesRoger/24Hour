import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/model/item_select.dart';

class RoundSelectFormField extends StatelessWidget {
  final Alignment alignment;
  final EdgeInsetsGeometry margin;
  final String hint;
  final double height;
  final double width;
  final List<ItemSelect> items;
  final ValueChanged<ItemSelect> onChanged;
  final FormFieldSetter<ItemSelect> onSaved;
  final FormFieldValidator<ItemSelect> validator;
  final ItemSelect value;
  final EdgeInsetsGeometry hintPadding;
  final double percentPadding;
  final Widget prefixIcon;
  final Widget suffixIcon;

  const RoundSelectFormField({
    @required this.items,
    this.hint,
    this.alignment,
    this.height,
    this.width,
    this.onChanged,
    this.validator,
    this.value,
    this.hintPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.percentPadding = 15.0,
    this.margin = const EdgeInsets.only(
      top: 10.0,
      left: 40.0,
      right: 40.0,
      bottom: 10.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      alignment: alignment ?? Alignment.center,
      width: width,
      height: height,
      child: DropdownButtonFormField<ItemSelect>(
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item.label,
                  overflow: TextOverflow.visible,
                ),
              ),
            )
            .toList(),
        hint: Padding(
          padding: hintPadding != null
              ? hintPadding
              : EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width / 100) *
                      percentPadding,
                ),
          child: Text(
            hint,
            textAlign: TextAlign.center,
          ),
        ),
        onChanged: onChanged ?? (val) {},
        validator: validator,
        value: value,
        onSaved: onSaved,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(
            left: 10.0,
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
