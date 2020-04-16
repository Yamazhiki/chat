import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  static List<String> _tabs = ["关注", "话题"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: DefaultTabController(
            length: _tabs.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  labelColor: Colors.black87,
                  unselectedLabelStyle: TextStyle(fontSize: 16),
                  unselectedLabelColor: Colors.black45,
                  indicator: BoxDecoration(),
                  tabs: _tabs
                      .map((e) => Container(padding: EdgeInsets.all(10), child: Text(e)))
                      .toList(),
                ),
                Divider(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(16),
                    child: TabBarView(
                      children: <Widget>[_focusList(context), _topicList(context)],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _focusList(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, idx) => ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=38073125,1946515008&fm=26&gp=0.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text("南风不竞"),
                  ),
                  Text("Yamazhiki")
                ],
              ),
              subtitle: Column(
                children: <Widget>[
                  Text(
                    "CustomScrollView是可以使用Sliver来自定义滚动模型（效果）的组件",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.chat,
                              color: Colors.grey,
                            ),
                            Text("133")
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                              Text("133")
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              trailing: Icon(
                Icons.video_call,
                color: Colors.red,
              ),
            ),
        separatorBuilder: (_, idx) => Divider(
              height: 20,
            ),
        itemCount: 5);
  }

  Widget _topicList(BuildContext context) {
    return Text("asdf");
  }
}
