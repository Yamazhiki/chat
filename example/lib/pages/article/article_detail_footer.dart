import 'package:flutter/material.dart';

class ArticleDetailFooter extends StatelessWidget {
  const ArticleDetailFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFEFEFEF), width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 30,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration:
                    BoxDecoration(color: Color(0xFFECEEEE), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "我来说两句",
                      style: TextStyle(color: Color(0xFFA8A8A8), fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {},
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.orange,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.star_border, color: Colors.red),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
