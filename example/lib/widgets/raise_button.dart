import 'package:flutter/material.dart';

class SSRaisedButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Widget content;
  final Function onPress;

  const SSRaisedButton({Key key, this.color, this.textColor, this.content, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.1,
      focusElevation: 0.1,
      highlightElevation: 0.1,
      color: this.color,
      textColor: this.textColor,
      onPressed: this.onPress,
      child: this.content,
    );
  }
}
