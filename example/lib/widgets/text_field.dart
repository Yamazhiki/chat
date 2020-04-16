import 'package:flutter/material.dart';

class SSTextField extends StatelessWidget {
  final Widget prefix;
  final Widget suffix;

  final String hitText;
  final bool obscureText;

  const SSTextField({Key key, this.prefix, this.suffix, this.hitText, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.obscureText,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: this.hitText,
      ),
    );
  }
}
