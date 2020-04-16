import 'package:chat_example/widgets/clip_x_network_image.dart';
import 'package:chat_example/widgets/left_icon_tile.dart';
import 'package:chat_example/widgets/rounded_icon.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: <Widget>[
          _header(context),
          _middle(context),
          Expanded(flex: 1, child: _list(context))
        ],
      ),
    );
  }

  ///头部
  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF217EFF), Color(0xFF005AD9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipXNetworkImage(
                          url:
                              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3948863708,1225019901&fm=26&gp=0.jpg",
                          size: 60,
                          borderRadius: 5,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "南风不竞",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          GestureDetector(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "查看个人主页",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Text("申请认证"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Text(
                        "关注",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Text(
                        "评论",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Text(
                        "关注",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Text(
                        "粉丝",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  ///头部中间部分
  Widget _middle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "13804",
                        style: TextStyle(
                            color: Color(0xFFFF7838), fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text("我的金币", style: TextStyle(color: Colors.black87, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "13804",
                        style: TextStyle(
                            color: Color(0xFFFF7838), fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text("今日金币", style: TextStyle(color: Colors.black87, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "12",
                        style: TextStyle(
                            color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text("今日阅读", style: TextStyle(color: Colors.black87, fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///二列（发表文章）
  Widget _middle2(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          LeftIconTile(
            icon: CircleIcon(
              backgroundColor: Color(0xFF2EA5FB),
              padding: EdgeInsets.all(5),
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            title: Text(
              "发布文章",
              style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            subTitle: Text(
              "发布后，发布文章赚金币",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
              ),
            ),
          ),
          LeftIconTile(
            icon: CircleIcon(
              backgroundColor: Color(0xFFF7C82D),
              padding: EdgeInsets.all(5),
              icon: Icon(
                Icons.monetization_on,
                color: Colors.white,
              ),
            ),
            title: Text(
              "提现兑换",
              style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            subTitle: Text(
              "看文章留言赚金币",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///条目
  Widget _list(BuildContext context) {
    final List<Tuple3<IconData, String, Color>> items = List.from([
      Tuple3(Icons.flag, "活动中心", Color(0xFF1576FF)),
      Tuple3(Icons.star, "我的收藏", Color(0xFFFC6A5F)),
      Tuple3(Icons.access_time, "历史浏览", Color(0xFFFFCE2D)),
      Tuple3(Icons.feedback, "意见反馈", Color(0xFF1576FF)),
    ]);
    return ListView.separated(
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (_, idx) {
          switch (idx) {
            case 0:
              return _middle2(context);
            default:
              return Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    items[idx - 1].value1,
                    color: items[idx - 1].value3,
                  ),
                  title: Text(items[idx - 1].value2),
                  trailing: Icon(Icons.chevron_right),
                ),
              );
          }
          ;
        },
        separatorBuilder: (_, idx) {
          switch (idx) {
            case 0:
              return SizedBox(
                height: 10,
              );
            default:
              return SizedBox(
                height: 1,
              );
          }
        },
        itemCount: 5);
  }
}
