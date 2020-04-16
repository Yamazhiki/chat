import 'package:flutter/material.dart';

class SSFlatFillButton extends StatelessWidget {
  final Color color;
  final Widget content;
  final VoidCallback onPressed;

  const SSFlatFillButton({Key key, this.color, this.content, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      highlightColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        child: Center(
          child: this.content,
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
