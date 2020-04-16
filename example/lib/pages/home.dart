import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_example/widgets/raise_button.dart';
import 'package:flutter/material.dart';

import 'article/article_detail.dart';

class HomePage extends StatelessWidget {
  static List<String> _tabs = ["综合", "推荐", "居家", "餐厨", "配件", "服装"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              _search(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: DefaultTabController(
                  length: _tabs.length,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        indicatorColor: Colors.blue,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        indicatorPadding: EdgeInsets.only(left: 10, right: 10),
                        tabs: _tabs.map((e) => Text(e)).toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: _tabs.map((e) => _mix(context)).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _search() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SSRaisedButton(
            color: Color(0xFFEFEFEF),
            content: Row(
              children: <Widget>[Icon(Icons.search), Text("搜索")],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                color: Colors.deepOrangeAccent,
              ),
              Text("赚钱")
            ],
          ),
        )
      ],
    );
  }

  Widget _mix(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            height: 140,
            color: Colors.blue,
            child: CachedNetworkImage(
              imageUrl:
                  "http://t8.baidu.com/it/u=3571592872,3353494284&fm=79&app=86&f=JPEG?w=1200&h=1290",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 10),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (_, idx) => InkWell(
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => ArticleDetailPage())),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "在进入今天的正题之前,我们先来简单了解下今天的两个主角CustomScrollView和Sliver",
                                  maxLines: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            "置顶",
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.chat,
                                        size: 20,
                                      ),
                                      Text("123")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=38073125,1946515008&fm=26&gp=0.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              childCount: 5),
        )
      ],
    );
  }
}
