import 'package:flutter/material.dart';

class SSAppBar extends AppBar {
  final Widget title;
  final Key key;

  SSAppBar({
    this.key,
    this.title,
  }) : super(key: key, title: title, backgroundColor: Colors.transparent, elevation: 0);
}
