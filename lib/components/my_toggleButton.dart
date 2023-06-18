import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class myToggleButton extends StatelessWidget {
  const myToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GFToggle(
      onChanged: (val) {},
      value: true,
      type: GFToggleType.ios,
    );
  }
}
