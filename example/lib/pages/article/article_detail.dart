import 'package:flutter/material.dart';

import 'article_detail_comment_item.dart';
import 'article_detail_content.dart';
import 'article_detail_footer.dart';

class ArticleDetailPage extends StatefulWidget {
  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("详细"),
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: ArticleDetailContent(),
          ),
          SliverToBoxAdapter(
            child: _favorite(context),
          ),
          SliverToBoxAdapter(
            child: _commentsTitle(context),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, idx) {
              return ArticleDetailCommentItem();
            }, childCount: 5),
          )
        ],
      ),
      bottomNavigationBar: ArticleDetailFooter(),
    );
  }

  Widget _favorite(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [1, 2]
                .map((e) => Positioned(
                      child: Placeholder(
                        fallbackHeight: 20,
                        fallbackWidth: 20,
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(text: "已有", style: TextStyle(color: Colors.black45), children: [
                  TextSpan(text: "3", style: TextStyle(color: Colors.orange)),
                  TextSpan(text: "人赞赏了作者")
                ]),
              ),
              Icon(Icons.chevron_right)
            ],
          )
        ],
      ),
    );
  }

  Widget _commentsTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "全部评论",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
