import 'package:chat_example/widgets/clip_x_network_image.dart';
import 'package:flutter/material.dart';

class ArticleDetailContent extends StatelessWidget {
  const ArticleDetailContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "意大利日增4207例，小卡公开炮轰：中国捐口罩你们卖400元",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
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
                      size: 50,
                      borderRadius: 5,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Yamazhiki"),
                      Row(
                        children: <Widget>[Text("03-23"), Text("阅读 181537")],
                      ),
                    ],
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("关注"),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                "      北京时间3月19日，意大利疫情越发严重，成为全球最严重的国家，截止早些时候的数据显示，意大利迎来了死亡人数增速最快的悲伤一天，新增死亡475人，累计达到2978人，感染总数一天新增4207人，累计总人数35713人。而重灾区伦巴第，死亡人数一天新增319人，所以意大利死亡人数再破纪录，医护人员已感染2629人"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 30,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF0EEEE), width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        size: 18,
                        color: Colors.amber,
                      ),
                      Text(" 143")
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 80,
              ),
              GestureDetector(
                child: Container(
                  height: 30,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF0EEEE), width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: Colors.blue,
                      ),
                      Text(" 143")
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
