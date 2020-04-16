import 'package:chat/model/user.dart';
import 'package:flutter/material.dart';

import 'add_friend.dart';
import 'friend_send_request.dart';

class FriendInfoPage extends StatelessWidget {
  final IMUser user;

  FriendInfoPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (ctx) =>
                ["我发起的好友请求"].map((e) => PopupMenuItem<String>(child: Text(e))).toList(),
            onSelected: (e) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => FriendSendRequestsPage()));
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Placeholder(
                  fallbackWidth: 60,
                  fallbackHeight: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(user.userId),
                )
              ],
            ),
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddFriendPage(
                              user: user,
                            )));
              },
              child: Text("添加好友"))
        ],
      ),
    );
  }
}
