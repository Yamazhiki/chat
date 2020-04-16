import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final Color backgroundColor;
  final Widget icon;
  final EdgeInsetsGeometry padding;
  const CircleIcon({
    Key key,
    this.backgroundColor,
    this.icon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
        child: this.icon);
  }
}
