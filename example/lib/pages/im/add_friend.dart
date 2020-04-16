import 'package:chat/model/user.dart';
import 'package:chat_example/domain/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFriendPage extends StatelessWidget {
  final IMUser user;

  AddFriendPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("添加好友"),
        actions: <Widget>[
          Consumer<ChatProvider>(
            builder: (_, provider, __) => FlatButton(
              onPressed: () async {
                final result = await provider.manager.sendFriendRequest(user.userId, reason: "");
                print(result);
              },
              child: Text("确定"),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("你需要发送好友邀请,等待对方通过"),
            SizedBox(
              height: 10,
            ),
            TextField(
              textInputAction: TextInputAction.done,
            )
          ],
        ),
      ),
    );
  }
}
