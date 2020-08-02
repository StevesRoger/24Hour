import 'package:flutter/material.dart';
import 'package:twentyfour_hour/src/util/constant.dart';

class CheckBox<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Color activeColor;
  final String label;
  final ValueChanged<T> onChanged;

  const CheckBox({
    @required this.value,
    @required this.groupValue,
    this.activeColor,
    @required this.label,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio<T>(
          value: value,
          groupValue: groupValue,
          activeColor: activeColor ?? Themes.purpleDark,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(label),
      ],
    );
  }
}
