import 'package:chat_example/widgets/clip_x_network_image.dart';
import 'package:flutter/material.dart';

class ArticleDetailCommentItem extends StatelessWidget {
  const ArticleDetailCommentItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipXNetworkImage(
                      url:
                          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=38073125,1946515008&fm=26&gp=0.jpg",
                      size: 20,
                      borderRadius: 2,
                    ),
                  ),
                  Text("南风不竞"),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.favorite_border),
                  SizedBox(
                    width: 5,
                  ),
                  Text("143")
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text("这是什么电影？有意思"),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Text(
                  "共2条回复",
                  style: TextStyle(color: Colors.blue),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.blue,
                )
              ],
            ),
            onTap: () {},
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Placeholder(
                    fallbackWidth: 10,
                    fallbackHeight: 10,
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(text: "赞赏过", style: TextStyle(color: Colors.black54), children: [
                  TextSpan(text: "14", style: TextStyle(color: Color(0xFFFF7838))),
                  TextSpan(text: "金币")
                ]),
              )
            ],
          ),
          Divider(
            height: 40,
          )
        ],
      ),
    );
  }
}
