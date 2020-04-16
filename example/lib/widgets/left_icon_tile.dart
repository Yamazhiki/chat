import 'package:flutter/material.dart';

class LeftIconTile extends StatelessWidget {
  final Widget icon;
  final Widget title;
  final Widget subTitle;
  final VoidCallback onTap;

  const LeftIconTile({Key key, this.title, this.icon, this.subTitle, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: icon,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[this.title, if (this.subTitle != null) this.subTitle],
          )
        ],
      ),
    );
  }
}
